SELECT
    f.Puntos,
    f.SubscriberKey,
    f.EntryDate,
    f.Dinamica,
    f.Cantidad_ticket,
    f.Nombre_sucursal,
    f.Zona,
    f.Tiene_App,
    f.Premio_Canjeado,
    f.Premio_Entregado,
    'MX' AS Locale
FROM
    [Ora_Pre_Fiestononon] f
WHERE
    f.Tiene_App IN ('0', 'false')
    AND NOT EXISTS (
        SELECT
            1
        FROM
            [BDD_General_Completa] b
        WHERE
            b.Contact_Id = f.SubscriberKey
    )
