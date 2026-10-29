SELECT
    me.Email,
    me.Nombre,
    s.ContactosContratados,
    s.ContactosActuales,
    s.CorreoEnviar
FROM
    [MasterEmailAvisos] AS me
    LEFT JOIN [Setup] AS s ON s.id = 1
