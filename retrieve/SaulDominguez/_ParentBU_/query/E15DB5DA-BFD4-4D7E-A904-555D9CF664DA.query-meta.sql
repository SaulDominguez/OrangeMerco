SELECT
    Email,
    nombre,
    CONCAT('52', telefono) AS telefono,
    Contact_Id,
    'MX' AS Locale
FROM
    [001_Progressive_Profiling_Registros_Nuevos]
