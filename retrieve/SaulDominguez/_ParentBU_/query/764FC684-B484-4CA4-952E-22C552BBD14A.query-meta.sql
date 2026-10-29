SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    hb.UltimoHardBounce,
    hb.TotalHardBounces
FROM
    [BDD_General_Completa] b
    INNER JOIN (
        SELECT
            SubscriberKey,
            MAX(EventDate) AS UltimoHardBounce,
            COUNT(*) AS TotalHardBounces
        FROM
            _Bounce
        WHERE
            BounceCategory = 'Hard bounce'
        GROUP BY
            SubscriberKey
    ) hb ON b.Contact_Id = hb.SubscriberKey
