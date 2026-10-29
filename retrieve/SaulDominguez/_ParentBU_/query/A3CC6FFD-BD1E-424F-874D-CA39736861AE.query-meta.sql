SELECT
    TOP 24995 bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone
FROM
    [BDD_General] bdg
    LEFT JOIN [ipWarming_Base_Contactados_Pieza5] cnt ON bdg.Contact_Id = cnt.Contact_Id
    LEFT JOIN [ipWarming_Unsubscribe_Updated] uns ON bdg.Contact_Id = uns.SubscriberKey
    LEFT JOIN [ipWarming_AllBounce] bnc ON bdg.Contact_Id = bnc.SubscriberKey
WHERE
    cnt.Contact_Id IS NULL
    AND uns.SubscriberKey IS NULL
    AND bnc.SubscriberKey IS NULL
    AND (
        bdg.email LIKE '%@gmail%'
        OR bdg.email LIKE '%@googlemail%'
    )
UNION
SELECT
    TOP 13929 bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone
FROM
    [BDD_General] bdg
    LEFT JOIN [ipWarming_Base_Contactados_Pieza5] cnt ON bdg.Contact_Id = cnt.Contact_Id
    LEFT JOIN [ipWarming_Unsubscribe_Updated] uns ON bdg.Contact_Id = uns.SubscriberKey
    LEFT JOIN [ipWarming_AllBounce] bnc ON bdg.Contact_Id = bnc.SubscriberKey
WHERE
    cnt.Contact_Id IS NULL
    AND uns.SubscriberKey IS NULL
    AND bnc.SubscriberKey IS NULL
    AND (
        bdg.email LIKE '%@Outlook%'
        OR bdg.email LIKE '%@Hotmail%'
        OR bdg.email LIKE '%@live%'
        OR bdg.email LIKE '%@msn%'
        OR bdg.email LIKE '%@windowslive%'
    )
UNION
SELECT
    TOP 918 bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone
FROM
    [BDD_General] bdg
    LEFT JOIN [ipWarming_Base_Contactados_Pieza5] cnt ON bdg.Contact_Id = cnt.Contact_Id
    LEFT JOIN [ipWarming_Unsubscribe_Updated] uns ON bdg.Contact_Id = uns.SubscriberKey
    LEFT JOIN [ipWarming_AllBounce] bnc ON bdg.Contact_Id = bnc.SubscriberKey
WHERE
    cnt.Contact_Id IS NULL
    AND uns.SubscriberKey IS NULL
    AND bnc.SubscriberKey IS NULL
    AND (
        bdg.email LIKE '%@Yahoo%'
        OR bdg.email LIKE '%@aol%'
        OR bdg.email LIKE '%@ymail%'
        OR bdg.email LIKE '%@rocketmail%'
        OR bdg.email LIKE '%@yahoogroups%'
        OR bdg.email LIKE '%@aim%'
        OR bdg.email LIKE '%@netscape%'
        OR bdg.email LIKE '%@icq%'
        OR bdg.email LIKE '%@icqmail%'
        OR bdg.email LIKE '%@compuserve%'
    )
UNION
SELECT
    TOP 4601 bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone
FROM
    [BDD_General] bdg
    LEFT JOIN [ipWarming_Base_Contactados_Pieza5] cnt ON bdg.Contact_Id = cnt.Contact_Id
    LEFT JOIN [ipWarming_Unsubscribe_Updated] uns ON bdg.Contact_Id = uns.SubscriberKey
    LEFT JOIN [ipWarming_AllBounce] bnc ON bdg.Contact_Id = bnc.SubscriberKey
WHERE
    cnt.Contact_Id IS NULL
    AND uns.SubscriberKey IS NULL
    AND bnc.SubscriberKey IS NULL
    AND (
        bdg.email NOT LIKE '%@Outlook%'
        AND bdg.email NOT LIKE '%@Hotmail%'
        AND bdg.email NOT LIKE '%@live%'
        AND bdg.email NOT LIKE '%@msn%'
        AND bdg.email NOT LIKE '%@windowslive%'
        AND bdg.email NOT LIKE '%@Gmail%'
        AND bdg.email NOT LIKE '%@googlbdg.email%'
        AND bdg.email NOT LIKE '%@Yahoo%'
        AND bdg.email NOT LIKE '%@Aol%'
        AND bdg.email NOT LIKE '%@aol%'
        AND bdg.email NOT LIKE '%@ymail%'
        AND bdg.email NOT LIKE '%@rocketmail%'
        AND bdg.email NOT LIKE '%@yahoogroups%'
        AND bdg.email NOT LIKE '%@aim%'
        AND bdg.email NOT LIKE '%@netscape%'
        AND bdg.email NOT LIKE '%@icq%'
        AND bdg.email NOT LIKE '%@icqmail%'
        AND bdg.email NOT LIKE '%@compuserve%'
    )
