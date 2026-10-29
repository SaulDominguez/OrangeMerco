/* =====================================================================
6. Sin App que ya están acumulando puntos (cualquier cantidad > 0)
Fuentes de "sin app": Clientes_Sin_App, Ora (Tiene_App = false)
y Clientes_No_participa (TieneApp = false)
Fuentes de puntos: TicketsYPuntosMasAltos, Ora y Clientes_No_participa
DE destino sugerida: Seg_SinApp_ConPuntos
===================================================================== */
SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.NumSucursal,
    b.FechaNacimiento,
    b.Locale,
    b.Genero,
    b.Estado,
    b.Ciudad,
    b.MedioComunicacion,
    b.Frecuencia,
    b.Colonia,
    b.OptInWhatsapp,
    b.frutasVerduras,
    b.Salchichoneria,
    b.CarnesPescados,
    b.Panaderia,
    b.abarrotes,
    b.articulosBebe,
    b.bebidas,
    b.higieneCuidadoPersonal,
    b.MercanciasGenerales,
    b.OptOutWhatsapp,
    b.Zona,
    b.NoRecibirComunicacion,
    b.ClienteNL,
    b.ClienteSALT,
    b.ClienteMVA_CARB_PN,
    b.DateModified,
    b.ServicioDomicilio,
    b.WA_VIP,
    b.WA_ALL,
    b.SMS_codigo_entry,
    b.Tiene_Telefono,
    b.Tiene_Correo,
    b.Tiene_Ambos
FROM
    BDD_General_Completa b
WHERE
    /* Tiene App = false */
    (
        EXISTS (
            SELECT
                1
            FROM
                Clientes_Sin_App sa
            WHERE
                sa.contactid = b.Contact_Id
        )
        OR EXISTS (
            SELECT
                1
            FROM
                Ora_Pre_Fiestononon o
            WHERE
                o.SubscriberKey = b.Contact_Id
                AND o.Tiene_App = 0
        )
        OR EXISTS (
            SELECT
                1
            FROM
                Clientes_No_participan np
            WHERE
                np.contactId = b.Contact_Id
                AND np.TieneApp = 0
        )
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            Clientes_Con_App ca
        WHERE
            ca.contactid = b.Contact_Id
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            Ora_Pre_Fiestononon o
        WHERE
            o.SubscriberKey = b.Contact_Id
            AND o.Tiene_App = 1
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            Clientes_No_participan np
        WHERE
            np.contactId = b.Contact_Id
            AND np.TieneApp = 1
    )
    /* Con puntos en cualquiera de las DE de puntos */
    AND (
        EXISTS (
            SELECT
                1
            FROM
                TicketsYPuntosMasAltos t
            WHERE
                t.contactid = b.Contact_Id
                AND t.puntos > 0
        )
        OR EXISTS (
            SELECT
                1
            FROM
                Ora_Pre_Fiestononon o
            WHERE
                o.SubscriberKey = b.Contact_Id
                AND o.Puntos > 0
        )
        OR EXISTS (
            SELECT
                1
            FROM
                Clientes_No_participan np
            WHERE
                np.contactId = b.Contact_Id
                AND np.Puntos > 0
        )
    )
