SELECT
    Contact_Id,
    'Email' AS MedioComunicacion
FROM
    BDD_General
WHERE
    Phone IN (
        SELECT
            MobileNumber
        FROM
            SMSServicioRevison
    )
