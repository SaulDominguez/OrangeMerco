SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.Estado,
    b.Ciudad,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [Clientes_Con_App] c
            WHERE
                c.telefono = b.Phone
        ) THEN 1
        ELSE 0
    END AS Tiene_APP,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [Clientes_Con_App] c
            WHERE
                c.telefono = b.Phone
        )
        AND EXISTS (
            SELECT
                1
            FROM
                [Clientes_Sin_App] s
            WHERE
                s.telefono = b.Phone
        ) THEN 'Ambas'
        WHEN EXISTS (
            SELECT
                1
            FROM
                [Clientes_Con_App] c
            WHERE
                c.telefono = b.Phone
        ) THEN 'Con App'
        ELSE 'Sin App'
    END AS Lista_Origen
FROM
    BDD_General_Completa b
WHERE
    EXISTS (
        SELECT
            1
        FROM
            [Clientes_Con_App] c
        WHERE
            c.telefono = b.Phone
    )
    OR EXISTS (
        SELECT
            1
        FROM
            [Clientes_Sin_App] s
        WHERE
            s.telefono = b.Phone
    )
