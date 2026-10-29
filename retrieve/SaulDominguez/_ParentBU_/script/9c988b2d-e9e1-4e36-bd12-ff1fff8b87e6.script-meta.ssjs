Platform.Load('core', '1.1.1');

/* ===== Claws Rewards -> SFMC | Script Activity: Claws_Sync ===== */
var CFG_DE = 'Claws_Config';
var SEG_DE = 'Claws_Segmentos';
var STG_DE = 'Claws_Usuarios_Stg';
var LOG_DE = 'Claws_Log';
var MAX_MS = 25 * 60 * 1000; // la Script Activity corta a los 30 min
var BATCH = 500; // filas por escritura con WSProxy
var MAX_PAGES = 5000; // tope de seguridad por segmento

var startMs = new Date().getTime();
var runId = String(Platform.Function.GUID());
var api = new Script.Util.WSProxy();
var BASE_URL, API_KEY, PAGE;

function fechaTexto() {
    var d = new Date();
    function p(n) {
        return (n < 10 ? '0' : '') + n;
    }
    return (
        d.getFullYear() +
        '-' +
        p(d.getMonth() + 1) +
        '-' +
        p(d.getDate()) +
        ' ' +
        p(d.getHours()) +
        ':' +
        p(d.getMinutes()) +
        ':' +
        p(d.getSeconds())
    );
}

function log(nivel, endpoint, pagina, status, registros, msg) {
    try {
        Platform.Function.InsertData(
            LOG_DE,
            ['RunId', 'Fecha', 'Endpoint', 'Pagina', 'StatusCode', 'Registros', 'Nivel', 'Mensaje'],
            [
                runId,
                fechaTexto(),
                endpoint || '',
                pagina || 0,
                status || 0,
                registros || 0,
                nivel,
                String(msg || '').substring(0, 3900)
            ]
        );
    } catch (e) {
        /* el log nunca debe tumbar el proceso */
    }
}

function cfg(clave) {
    var v = Platform.Function.Lookup(CFG_DE, 'Valor', 'Clave', clave);
    if (v == null || String(v) == '') {
        throw 'Falta configuracion en Claws_Config: ' + clave;
    }
    return String(v);
}

function tiempoAgotado() {
    return new Date().getTime() - startMs > MAX_MS;
}

// Tolera variaciones de mayusculas en los nombres de campo (Id / id, clave / Clave)
function campo(obj, nombres) {
    for (var i = 0; i < nombres.length; i++) {
        if (obj[nombres[i]] != null) {
            return obj[nombres[i]];
        }
    }
    return null;
}

function apiGet(path) {
    var url = BASE_URL + path;
    var req = new Script.Util.HttpRequest(url);
    req.emptyContentHandling = 0;
    req.retries = 2;
    req.continueOnError = true;
    req.method = 'GET';
    req.contentType = 'application/json';
    req.setHeader('x-api-key', API_KEY);

    var resp = req.send();
    var status = Number(resp.statusCode);
    var body = String(resp.content);
    var json = null;
    if (status == 200) {
        json = Platform.Function.ParseJSON(body);
        if (json == null) {
            throw 'Respuesta no es JSON valido en ' + url + ': ' + body.substring(0, 500);
        }
        if (String(campo(json, ['hasError', 'HasError'])).toLowerCase() == 'true') {
            throw (
                'API devolvio hasError en ' +
                url +
                ': ' +
                campo(json, ['message', 'Mensaje', 'mensaje'])
            );
        }
    }
    return { status: status, json: json, body: body, url: url };
}

function upsertBatch(deKey, filas) {
    for (var i = 0; i < filas.length; i += BATCH) {
        var objs = [];
        for (var j = i; j < filas.length && j < i + BATCH; j++) {
            var props = [];
            for (var k in filas[j]) {
                if (filas[j][k] != null) {
                    props.push({ Name: k, Value: String(filas[j][k]) });
                }
            }
            objs.push({ CustomerKey: deKey, Properties: props });
        }
        var r = api.updateBatch('DataExtensionObject', objs, {
            SaveOptions: [{ PropertyName: '*', SaveAction: 'UpdateAdd' }]
        });
        if (r.Status != 'OK') {
            throw 'Error escribiendo en ' + deKey + ': ' + Stringify(r).substring(0, 1500);
        }
    }
}

try {
    BASE_URL = cfg('BaseUrl').replace(/\/+$/, '');
    API_KEY = cfg('ApiKey');
    PAGE = Number(cfg('PageSize')) || 1000;
    if (PAGE > 1000) {
        PAGE = 1000;
    }
    var ahora = fechaTexto();
    log('INFO', '', 0, 0, 0, 'Inicio de corrida');

    /* 1. Vaciar staging */
    var clr = api.performItem('DataExtension', { CustomerKey: STG_DE }, 'ClearData');
    if (clr.Status != 'OK') {
        throw 'No se pudo vaciar ' + STG_DE + ': ' + Stringify(clr).substring(0, 1500);
    }

    /* 2. Catalogo de segmentos */
    var vistos = {}; // SegmentoId -> clave, solo los que regreso la API hoy
    var pagina = 1,
        leidos = 0,
        total = 0,
        segs;
    do {
        var r = apiGet('/v1/api/segmentos?pagina=' + pagina + '&cantidad=' + PAGE);
        if (r.status != 200) {
            throw 'GET segmentos respondio ' + r.status + ': ' + r.body.substring(0, 500);
        }
        var data = campo(r.json, ['data', 'Data']) || {};
        total = Number(campo(data, ['total', 'Total'])) || 0;
        segs = campo(data, ['segmentos', 'Segmentos']) || [];
        var filasSeg = [];
        for (var i = 0; i < segs.length; i++) {
            var id = campo(segs[i], ['Id', 'id', 'ID']);
            var clave = campo(segs[i], ['clave', 'Clave']);
            if (id == null) {
                continue;
            }
            vistos[String(id)] = String(clave);
            filasSeg.push({
                SegmentoId: id,
                Clave: clave,
                Descripcion: campo(segs[i], ['descripcion', 'Descripcion']),
                FechaActualizacion: ahora
            });
        }
        upsertBatch(SEG_DE, filasSeg);
        leidos += segs.length;
        log('INFO', r.url, pagina, 200, segs.length, 'Segmentos (total API: ' + total + ')');
        pagina++;
    } while (segs.length > 0 && leidos < total && pagina <= MAX_PAGES);

    /* 3. Segmentos a sincronizar = marcados Sincronizar=True y vigentes en la API */
    var marcados = Platform.Function.LookupRows(SEG_DE, 'Sincronizar', 'True');
    var totalesSeg = [];
    var totalFilas = 0;

    for (var s = 0; s < marcados.length; s++) {
        var segId = String(marcados[s]['SegmentoId']);
        if (vistos[segId] == null) {
            continue;
        }
        var segClv = vistos[segId];
        var p = 1,
            cargados = 0,
            totalU = 0,
            us;

        do {
            if (tiempoAgotado()) {
                throw 'Tiempo agotado (25 min) en segmento ' + segClv + ', pagina ' + p;
            }
            var ru = apiGet(
                '/v1/api/segmentos/' + segId + '/usuarios?pagina=' + p + '&cantidad=' + PAGE
            );
            if (ru.status == 404) {
                log('WARN', ru.url, p, 404, 0, ru.body);
                us = [];
                break;
            }
            if (ru.status != 200) {
                throw (
                    'GET usuarios ' +
                    segClv +
                    ' respondio ' +
                    ru.status +
                    ': ' +
                    ru.body.substring(0, 500)
                );
            }
            var du = campo(ru.json, ['data', 'Data']) || {};
            totalU = Number(campo(du, ['total', 'Total'])) || 0;
            us = campo(du, ['usuarios', 'Usuarios']) || [];
            var filasU = [];
            for (var u = 0; u < us.length; u++) {
                var uid = campo(us[u], ['Id', 'id', 'ID']);
                if (uid == null) {
                    continue;
                }
                filasU.push({
                    SegmentoId: segId,
                    UsuarioId: uid,
                    SegmentoClave: segClv,
                    Telefono: campo(us[u], ['telefono', 'Telefono']),
                    RunId: runId,
                    FechaCarga: ahora
                });
            }
            upsertBatch(STG_DE, filasU);
            cargados += us.length;
            log('INFO', ru.url, p, 200, us.length, segClv);
            p++;
        } while (us.length > 0 && cargados < totalU && p <= MAX_PAGES);

        if (cargados != totalU) {
            log(
                'WARN',
                '',
                0,
                0,
                cargados,
                segClv + ': cargados ' + cargados + ' vs total API ' + totalU
            );
        }
        totalFilas += cargados;
        totalesSeg.push({ SegmentoId: segId, TotalUsuarios: totalU });
    }
    upsertBatch(SEG_DE, totalesSeg);

    var segundos = Math.round((new Date().getTime() - startMs) / 1000);
    log(
        'INFO',
        '',
        0,
        200,
        totalFilas,
        'Fin OK: ' + totalesSeg.length + ' segmentos en ' + segundos + ' s'
    );
} catch (e) {
    log('ERROR', '', 0, 0, 0, typeof e == 'string' ? e : Stringify(e));
    throw e; // falla la Script Activity y se detiene la automatizacion
}
