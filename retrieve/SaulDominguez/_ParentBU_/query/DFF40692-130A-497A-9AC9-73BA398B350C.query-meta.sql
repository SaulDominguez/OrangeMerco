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
    b.Tiene_Correo = 1
    AND NOT EXISTS (
        SELECT
            1
        FROM
            [EnviosDeCorreo10102026Historico] h
        WHERE
            h.SubscriberKey = b.Contact_Id
            AND LTRIM(RTRIM(h.IsUnique)) IN ('1', 'true', 'True')
    )
