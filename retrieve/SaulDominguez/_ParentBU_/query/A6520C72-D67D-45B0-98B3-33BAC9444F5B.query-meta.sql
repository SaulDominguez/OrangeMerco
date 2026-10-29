SELECT
    Contact_Id,
    Email,
    Nombre,
    Apellido,
    Phone,
    Sucursal,
    Estado,
    Ciudad
FROM
    [BDD_General_Completa]
WHERE
    (
        Email IS NULL
        OR LTRIM(RTRIM(Email)) = ''
    )
    AND (
        Phone IS NULL
        OR LTRIM(RTRIM(Phone)) = ''
    )
