SELECT
    c.telefono AS Phone,
    c.contactid AS Contact_Id,
    1 AS Tiene_APP,
    'Con App' AS Lista_Origen
FROM
    [Clientes_Con_App] c
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            [Clientes_Ya_Registrados] r
        WHERE
            r.Phone = c.telefono
    )
UNION ALL
SELECT
    s.telefono AS Phone,
    s.contactid AS Contact_Id,
    0 AS Tiene_APP,
    'Sin App' AS Lista_Origen
FROM
    [Clientes_Sin_App] s
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            [Clientes_Ya_Registrados] r
        WHERE
            r.Phone = s.telefono
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            [Clientes_Con_App] c
        WHERE
            c.telefono = s.telefono
    )
