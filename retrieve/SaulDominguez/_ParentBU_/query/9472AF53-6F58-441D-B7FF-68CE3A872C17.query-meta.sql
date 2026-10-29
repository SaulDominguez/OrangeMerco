SELECT
    Contact_Id AS SubscriberKey,
    Phone
FROM
    BDD_General_Completa
WHERE
    NoRecibirComunicacion = 'True'
