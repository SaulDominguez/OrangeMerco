SELECT
    ws.Contactkey,
    ws.Mobilenumber,
    ws.Locale
FROM
    Whatsapp_Subscribers ws
    LEFT JOIN BDD_General bg ON bg.Phone = ws.Mobilenumber
WHERE
    bg.Phone IS NULL
