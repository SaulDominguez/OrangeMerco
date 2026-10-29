SELECT
    bdg.Contact_Id,
    bdg.Email,
    CASE
        WHEN bdg.Nombre IS NOT NULL THEN bdg.Nombre
        ELSE act.Nombre
    END AS Nombre,
    CASE
        WHEN bdg.Apellido IS NOT NULL THEN bdg.Apellido
        ELSE act.Apellido
    END AS Apellido,
    CASE
        WHEN bdg.Phone IS NOT NULL THEN bdg.Phone
        ELSE act.Telefono
    END AS Phone,
    act.Sucursal,
    act.NumSucursal
FROM
    BDD_General bdg
    INNER JOIN Activos act ON bdg.Email = act.Email
    LEFT JOIN ipWarming_AllBounce bounce ON bounce.Email = act.Email
    LEFT JOIN [ipWarming_Unsubscribe_Updated] uns ON bdg.Contact_Id = uns.SubscriberKey
WHERE
    bounce.SubscriberKey IS NULL
    AND uns.SubscriberKey IS NULL
