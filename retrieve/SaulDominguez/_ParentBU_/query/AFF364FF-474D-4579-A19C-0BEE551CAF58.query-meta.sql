SELECT
    b.*
FROM
    BDD_General_Completa b
    INNER JOIN Ora_Engagement_Check_Registros o ON b.Contact_Id = o.SubscriberKey
