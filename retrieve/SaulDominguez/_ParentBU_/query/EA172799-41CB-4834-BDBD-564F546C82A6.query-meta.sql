SELECT
    nombres,
    apellidos,
    Contact_Id,
    created_at,
    telefono,
    Locale,
    Email
FROM
    Fiestononon_2025_General_BKP_101125
WHERE
    created_at < '2025-11-09'
