SELECT
    b.*
FROM
    BDD_General_Completa b
    LEFT JOIN SMS_codigo_App s ON b.Contact_Id = s.SubscriberKey
WHERE
    s.SubscriberKey IS NULL
