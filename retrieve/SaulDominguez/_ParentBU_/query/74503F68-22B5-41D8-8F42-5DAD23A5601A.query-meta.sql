SELECT
    ws.Contactkey,
    ws.Mobilenumber,
    ws.Locale
FROM
    Whatsapp_Subscribers ws
    INNER JOIN BDD_General bg ON bg.Contact_Id = ws.Contactkey
