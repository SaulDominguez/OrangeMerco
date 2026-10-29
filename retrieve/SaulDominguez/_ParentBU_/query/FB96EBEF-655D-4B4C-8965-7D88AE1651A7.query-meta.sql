SELECT
    Contactkey AS Contactkey,
    mobilenumber AS Mobilenumber,
    GETDATE() AS Date_optedout
FROM
    [Whatsapp_OptOut_Requests]
