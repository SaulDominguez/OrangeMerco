SELECT
    bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone,
    bdg.Sucursal,
    bdg.NumSucursal
FROM
    BDD_General_Activos bdg
    LEFT JOIN ipWarming_Unsubscribe_Updated unsub ON bdg.Contact_Id = unsub.SubscriberKey
    LEFT JOIN _Bounce bounce ON bounce.SubscriberKey = bdg.Contact_Id
WHERE
    unsub.SubscriberKey IS NULL
    AND bounce.SubscriberKey IS NULL
