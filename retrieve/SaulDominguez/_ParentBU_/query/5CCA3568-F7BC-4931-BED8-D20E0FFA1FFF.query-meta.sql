SELECT
    Contact_Id,
    NULL AS Phone,
    'Email' AS MedioComunicacion
FROM
    BDD_General
WHERE
    Contact_Id IN (
        SELECT
            ContactKey
        FROM
            WhatsappUndeliverableSubscribers
    )
    AND Email IS NOT NULL
