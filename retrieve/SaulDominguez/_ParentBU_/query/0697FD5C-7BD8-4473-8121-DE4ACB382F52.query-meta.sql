SELECT
    Contact_Id,
    Email,
    Nombre,
    Apellido,
    Phone,
    Sucursal,
    Estado,
    Ciudad,
    CASE
        WHEN (
            Phone IS NOT NULL
            AND LTRIM(RTRIM(Phone)) <> ''
        ) THEN 'Solo telefono'
        ELSE 'Solo correo'
    END AS Tipo_Contacto
FROM
    [BDD_General_Completa]
WHERE
    (
        (
            Phone IS NOT NULL
            AND LTRIM(RTRIM(Phone)) <> ''
        )
        AND (
            Email IS NULL
            OR LTRIM(RTRIM(Email)) = ''
        )
    )
    OR (
        (
            Email IS NOT NULL
            AND LTRIM(RTRIM(Email)) <> ''
        )
        AND (
            Phone IS NULL
            OR LTRIM(RTRIM(Phone)) = ''
        )
    )
