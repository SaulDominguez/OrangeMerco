SELECT
    uq.Contact_Id,
    uq.EventDate AS LastBouncedOn,
    uq.BounceSubcategory AS
TYPE,
uq.Email AS EmailAddress
FROM
    (
        SELECT
            bg.Contact_Id,
            bg.Email,
            b.EventDate,
            b.BounceSubcategory,
            ROW_NUMBER() OVER (
                PARTITION BY
                    [Contact_Id]
                ORDER BY
                    b.EventDate DESC
            ) AS Row
        FROM
            BDD_General bg
            INNER JOIN _Bounce b ON b.SubscriberKey = bg.Contact_Id
        WHERE
            CONVERT(DATE, b.EventDate) >= DATEADD(day, -7, GETDATE())
    ) AS uq
WHERE
    uq.Row = 1
