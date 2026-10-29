SELECT
    x.contactid,
    x.puntos,
    x.cantidad_Tickets,
    x.zona,
    x.nombreSucursal
FROM
    (
        SELECT
            t.contactid,
            t.puntos,
            t.cantidad_Tickets,
            t.zona,
            t.nombreSucursal,
            ROW_NUMBER() OVER (
                PARTITION BY
                    LTRIM(RTRIM(t.contactid))
                ORDER BY
                    ISNULL(t.puntos, 0) DESC,
                    ISNULL(t.cantidad_Tickets, 0) DESC
            ) AS rn
        FROM
            Tickets_Puntos_Enviados t
        WHERE
            NULLIF(LTRIM(RTRIM(t.contactid)), '') IS NOT NULL
    ) x
WHERE
    x.rn = 1
