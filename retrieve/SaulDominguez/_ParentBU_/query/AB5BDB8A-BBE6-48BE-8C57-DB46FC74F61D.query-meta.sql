SELECT
    FORMAT(fr.Fecha_Registro, 'd') AS Fecha_Registro,
    fr.No_Tienda,
    COUNT(fr.ClaveUnica_Fiestononon) AS Conteo_Participantes,
    COUNT(
        CASE
            WHEN fr.Premio = 'Boleto' THEN 1
            ELSE NULL
        END
    ) AS Conteo_Boleto,
    COUNT(
        CASE
            WHEN fr.Premio = 'Premio' THEN 1
            ELSE NULL
        END
    ) AS Conteo_Premio,
    SUM(fr.Monto_Ticket) AS Monto_Ticket
FROM
    FIESTONONON_Registros fr
WHERE
    FORMAT(fr.Fecha_Registro, 'd') IS NOT NULL
    AND fr.No_Tienda IS NOT NULL
GROUP BY
    FORMAT(fr.Fecha_Registro, 'd'),
    fr.No_Tienda
