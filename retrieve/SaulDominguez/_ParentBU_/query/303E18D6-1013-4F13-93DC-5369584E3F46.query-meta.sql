SELECT
    Contact_Id AS SubscriberKey,
    Phone,
    Locale,
    Nombre,
    Apellido
FROM
    BDD_General_Completa
WHERE
    (
        NoRecibirComunicacion != 1
        OR NoRecibirComunicacion IS NULL
    )
    AND Phone IS NOT NULL
    AND LEN(Phone) = 12
