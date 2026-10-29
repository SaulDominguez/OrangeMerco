SELECT
    Contact_Id,
    'Whatsapp' AS MedioComunicacion
FROM
    BDD_General_Completa
WHERE
    Contact_Id LIKE 'AD_F_%'
