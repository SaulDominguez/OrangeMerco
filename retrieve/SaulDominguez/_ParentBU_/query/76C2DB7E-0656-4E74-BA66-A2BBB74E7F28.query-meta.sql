SELECT
    nue.Contact_Id,
    CASE
        WHEN LEN(nue.telefono) = 10 THEN CONCAT('52', nue.telefono)
        ELSE nue.telefono
    END AS telefono,
    'MX' AS LOCALE
FROM
    [001_Progressive_Profiling_Registros_Nuevos] nue
