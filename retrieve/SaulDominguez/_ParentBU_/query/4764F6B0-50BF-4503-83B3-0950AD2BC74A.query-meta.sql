SELECT
    bg.Contact_Id,
    ws.OptInWhatsapp,
    ws.OptOutWhatsapp
FROM
    BDD_General bg
    JOIN BDD_General_Whatsapp ws ON ws.Contact_Id = bg.Contact_Id
WHERE
    ws.OptInWhatsapp = 2
