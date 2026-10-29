/* =====================================================================
3. 2,500+ puntos CON App
DE destino sugerida: Seg_2500_ConApp
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
    /* Tiene App = true */
    (
        EXISTS (
            SELECT
                1
            FROM
                Clientes_Con_App ca
            WHERE
                ca.contactid = b.Contact_Id
        )
        OR EXISTS (
            SELECT
                1
            FROM
                Ora_Pre_Fiestononon o
            WHERE
                o.SubscriberKey = b.Contact_Id
                AND o.Tiene_App = 1
        )
    )
    /* 2,500+ puntos: manda Tickets; si no está ahí, Ora */
    AND (
        EXISTS (
            SELECT
                1
            FROM
                TicketsYPuntosMasAltos t
            WHERE
                t.contactid = b.Contact_Id
                AND t.puntos >= 2500
        )
        OR (
            NOT EXISTS (
                SELECT
                    1
                FROM
                    TicketsYPuntosMasAltos t
                WHERE
                    t.contactid = b.Contact_Id
            )
            AND EXISTS (
                SELECT
                    1
                FROM
                    Ora_Pre_Fiestononon o
                WHERE
                    o.SubscriberKey = b.Contact_Id
                    AND o.Puntos >= 2500
            )
        )
    )
