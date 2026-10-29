SELECT
    a.SubscriberKey
FROM
    [AllContacts_Merco] a
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            [BDD_General_Completa] b
        WHERE
            b.Contact_Id = a.SubscriberKey
    )
