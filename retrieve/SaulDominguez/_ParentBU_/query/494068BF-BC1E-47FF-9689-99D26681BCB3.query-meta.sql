SELECT
    r.SubscriberKey,
    r.Puntos,
    a.EntryDate,
    r.Dinamica,
    r.Cantidad_ticket,
    COALESCE(r.Nombre_sucursal, a.Nombre_sucursal) AS Nombre_sucursal,
    COALESCE(r.Zona, a.Zona) AS Zona,
    a.Tiene_App,
    a.Premio_Canjeado,
    a.Premio_Entregado
FROM
    (
        SELECT
            x.SubscriberKey,
            x.Puntos,
            x.Dinamica,
            x.Cantidad_ticket,
            x.Nombre_sucursal,
            x.Zona,
            ROW_NUMBER() OVER (
                PARTITION BY
                    x.SubscriberKey
                ORDER BY
                    x.Puntos DESC,
                    x.EntryDate DESC
            ) AS rn
        FROM
            (
                SELECT
                    SubscriberKey,
                    Puntos,
                    EntryDate,
                    Dinamica,
                    Cantidad_ticket,
                    Nombre_sucursal,
                    Zona,
                    Tiene_App,
                    Premio_Canjeado,
                    Premio_Entregado
                FROM
                    Ora_Pre_Fiestononon
                WHERE
                    SubscriberKey IS NOT NULL
                    AND EntryDate >= DATEADD(DAY, -2, GETDATE())
                UNION ALL
                SELECT
                    u.SubscriberKey,
                    u.Puntos,
                    u.EntryDate,
                    u.Dinamica,
                    u.Cantidad_ticket,
                    u.Nombre_sucursal,
                    u.Zona,
                    u.Tiene_App,
                    u.Premio_Canjeado,
                    u.Premio_Entregado
                FROM
                    Ora_Exit_Fiestononon_2026 u
                WHERE
                    EXISTS (
                        SELECT
                            1
                        FROM
                            Ora_Pre_Fiestononon o
                        WHERE
                            o.SubscriberKey = u.SubscriberKey
                            AND o.EntryDate >= DATEADD(DAY, -2, GETDATE())
                    )
            ) x
    ) r
    INNER JOIN (
        SELECT
            x.SubscriberKey,
            MAX(x.EntryDate) AS EntryDate,
            MAX(x.Nombre_sucursal) AS Nombre_sucursal,
            MAX(x.Zona) AS Zona,
            MAX(
                CASE
                    WHEN x.Tiene_App = 1 THEN 1
                    ELSE 0
                END
            ) AS Tiene_App,
            MAX(
                CASE
                    WHEN x.Premio_Canjeado = 1 THEN 1
                    ELSE 0
                END
            ) AS Premio_Canjeado,
            MAX(
                CASE
                    WHEN x.Premio_Entregado = 1 THEN 1
                    ELSE 0
                END
            ) AS Premio_Entregado
        FROM
            (
                SELECT
                    SubscriberKey,
                    Puntos,
                    EntryDate,
                    Dinamica,
                    Cantidad_ticket,
                    Nombre_sucursal,
                    Zona,
                    Tiene_App,
                    Premio_Canjeado,
                    Premio_Entregado
                FROM
                    Ora_Pre_Fiestononon
                WHERE
                    SubscriberKey IS NOT NULL
                    AND EntryDate >= DATEADD(DAY, -2, GETDATE())
                UNION ALL
                SELECT
                    u.SubscriberKey,
                    u.Puntos,
                    u.EntryDate,
                    u.Dinamica,
                    u.Cantidad_ticket,
                    u.Nombre_sucursal,
                    u.Zona,
                    u.Tiene_App,
                    u.Premio_Canjeado,
                    u.Premio_Entregado
                FROM
                    Ora_Exit_Fiestononon_2026 u
                WHERE
                    EXISTS (
                        SELECT
                            1
                        FROM
                            Ora_Pre_Fiestononon o
                        WHERE
                            o.SubscriberKey = u.SubscriberKey
                            AND o.EntryDate >= DATEADD(DAY, -2, GETDATE())
                    )
            ) x
        GROUP BY
            x.SubscriberKey
    ) a ON a.SubscriberKey = r.SubscriberKey
WHERE
    r.rn = 1
