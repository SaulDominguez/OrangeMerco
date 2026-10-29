SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.Estado,
    b.Ciudad
FROM
    [BDD_General_Completa] b
WHERE
    b.Tiene_Telefono = 1
    AND NOT EXISTS (
        SELECT
            1
        FROM
            [Extract_Carga_SFTP] e
        WHERE
            e.ContactKey = b.Contact_Id
            AND LTRIM(RTRIM(e.Status)) = 'read'
    )
