SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.Estado,
    b.Ciudad,
    b.Zona,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [Clientes_Con_App] c
            WHERE
                c.contactid = b.Contact_Id
                OR c.telefono = b.Phone
        ) THEN 1
        ELSE 0
    END AS Tiene_App,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [Clientes_Con_App] c
            WHERE
                c.contactid = b.Contact_Id
                OR c.telefono = b.Phone
        )
        OR EXISTS (
            SELECT
                1
            FROM
                [Clientes_Sin_App] s
            WHERE
                s.contactid = b.Contact_Id
                OR s.telefono = b.Phone
        ) THEN 1
        ELSE 0
    END AS En_Lista_App
FROM
    [BDD_General_Completa] b
WHERE
    b.Zona LIKE '%Nuevo Le_n%'
