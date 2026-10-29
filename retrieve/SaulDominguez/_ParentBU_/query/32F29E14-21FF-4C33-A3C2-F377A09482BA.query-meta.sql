SELECT
    x.SubscriberKey AS Contact_Id,
    NULL AS Email,
    x.Nombre AS Nombre,
    NULL AS Apellido,
    x.Telefono AS Phone,
    NULL AS Sucursal,
    NULL AS NumSucursal,
    NULL AS FechaNacimiento,
    x.Locale,
    NULL AS Genero,
    NULL AS Estado,
    NULL AS Ciudad,
    NULL AS MedioComunicacion,
    NULL AS Frecuencia,
    NULL AS Colonia,
    NULL AS OptInWhatsapp,
    NULL AS frutasVerduras,
    NULL AS Salchichoneria,
    NULL AS CarnesPescados,
    NULL AS Panaderia,
    NULL AS abarrotes,
    NULL AS articulosBebe,
    NULL AS bebidas,
    NULL AS higieneCuidadoPersonal,
    NULL AS MercanciasGenerales,
    0 AS OptOutWhatsapp,
    NULL AS Zona,
    NULL AS NoRecibirComunicacion,
    0 AS ClienteNL,
    0 AS ClienteSALT,
    0 AS ClienteMVA_CARB_PN,
    GETDATE() AS DateModified,
    NULL AS ServicioDomicilio,
    NULL AS WA_VIP,
    NULL AS WA_ALL,
    1 AS SMS_codigo_entry
FROM
    (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    SubscriberKey
                ORDER BY
                    EntryDate DESC
            ) AS rn
        FROM
            SMS_codigo_App
    ) x
    LEFT JOIN BDD_General_Completa b ON x.SubscriberKey = b.Contact_Id
WHERE
    x.rn = 1
    AND b.Contact_Id IS NULL
