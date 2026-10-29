Platform.Load('core', '1.1.1');
/* Script de prueba: valida URL, llave y respuesta. Resultado en Claws_Log */
var runId = 'TEST_' + Platform.Function.GUID();
var url = '';
try {
    var baseUrl = String(
        Platform.Function.Lookup('Claws_Config', 'Valor', 'Clave', 'BaseUrl')
    ).replace(/\/+$/, '');
    var apiKey = String(Platform.Function.Lookup('Claws_Config', 'Valor', 'Clave', 'ApiKey'));
    url = baseUrl + '/v1/api/segmentos?pagina=1&cantidad=10';

    var req = new Script.Util.HttpRequest(url);
    req.emptyContentHandling = 0;
    req.retries = 1;
    req.continueOnError = true;
    req.method = 'GET';
    req.contentType = 'application/json';
    req.setHeader('x-api-key', apiKey);
    var resp = req.send();

    Platform.Function.InsertData(
        'Claws_Log',
        ['RunId', 'Fecha', 'Endpoint', 'Pagina', 'StatusCode', 'Registros', 'Nivel', 'Mensaje'],
        [
            runId,
            Platform.Function.Now(),
            url,
            1,
            Number(resp.statusCode),
            0,
            'TEST',
            String(resp.content).substring(0, 3900)
        ]
    );
} catch (e) {
    Platform.Function.InsertData(
        'Claws_Log',
        ['RunId', 'Fecha', 'Endpoint', 'Nivel', 'Mensaje'],
        [runId, Platform.Function.Now(), url, 'ERROR', Stringify(e).substring(0, 3900)]
    );
}
