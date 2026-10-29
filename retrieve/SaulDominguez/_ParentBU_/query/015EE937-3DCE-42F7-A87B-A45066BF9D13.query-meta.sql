SELECT
    t.Telefono,
    t.Codigo,
    t.FechaCreacion,
    t.FechaExpiracion,
    t.ProveedorId,
    t.ProveedorMensaje,
    t.SalesForceId,
    t.Estado,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [SMS_codigo_App] s
            WHERE
                s.Telefono = t.Telefono
        ) THEN 1
        ELSE 0
    END AS Coincide_Telefono,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [SMS_codigo_App] s
            WHERE
                s.SubscriberKey = t.SalesForceId
        ) THEN 1
        ELSE 0
    END AS Coincide_SalesForceId,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [SMS_codigo_App] s
            WHERE
                s.OTP = t.Codigo
        ) THEN 1
        ELSE 0
    END AS Coincide_Codigo
FROM
    [Total_Registros_Accord] t
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            [SMS_codigo_App] s
        WHERE
            s.Telefono = t.Telefono
            AND s.SubscriberKey = t.SalesForceId
            AND s.OTP = t.Codigo
    )
