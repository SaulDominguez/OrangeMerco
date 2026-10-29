SELECT
    out.Contactkey AS Contact_Id,
    out.Optoutstatus AS OptOutWhatsapp
FROM
    Whatsapp_OptOut_Requests out
    JOIN BDD_General_Whatsapp bg ON out.Contactkey = bg.Contact_Id
WHERE
    out.Optoutstatus = 1
