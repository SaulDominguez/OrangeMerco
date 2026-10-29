SELECT
    fg.*
FROM
    Fiestononon_2025_General fg
    INNER JOIN [Phone_Envio_Test] qr ON fg.Contact_Id = qr.ContactKey
