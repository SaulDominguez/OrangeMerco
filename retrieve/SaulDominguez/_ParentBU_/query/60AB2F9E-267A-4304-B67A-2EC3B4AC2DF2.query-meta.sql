SELECT
    o.*
FROM
    Ora_Envio_SAD_NL_Coahuila o
    LEFT JOIN Contactos_SFTP_Recibieron_Comunicacion s ON o.Contact_Id = s.GUID
WHERE
    s.GUID IS NULL
