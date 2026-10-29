SELECT
    fr.No_Tienda,
    COUNT(fr.ClaveUnica_Fiestononon) AS Conteo_Participantes,
    COUNT(
        CASE
            WHEN fr.Boleto = 'Boleto' THEN 1
            ELSE NULL
        END
    ) AS Conteo_Boleto,
    COUNT(
        CASE
            WHEN fr.Premio = 'Premio' THEN 1
            ELSE NULL
        END
    ) AS Conteo_Premio,
    SUM(fr.Monto_Ticket) AS Monto_Ticket,
    GETDATE() AS Fecha_Registro,
    'True' AS [Return]
FROM
    FIESTONONON_Registros_2024 fr
WHERE
    fr.No_Tienda IS NOT NULL
GROUP BY
    fr.No_Tienda
