SELECT
    *
FROM
    BDD_General_Completa
WHERE
    Phone IS NOT NULL
    AND Phone <> ''
    AND LEN(Phone) = 12
    AND OptOutWhatsapp = 0
