SELECT DISTINCT
    c.Correo,
    c.Phone_52
FROM
    Contactos_Nuevos_SFTP_170826 c
    INNER JOIN [Contactos_SFTP_Recibieron_Comunicacion] d ON LOWER(LTRIM(RTRIM(c.Correo))) = LOWER(LTRIM(RTRIM(d.Correo)))
WHERE
    c.Phone_52 IS NOT NULL
    AND LTRIM(RTRIM(c.Phone_52)) <> ''
