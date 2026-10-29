SELECT DISTINCT
    c.Nombres,
    c.Apellidos,
    c.Correo,
    c.Locale,
    NEWID() AS GUID,
    c.Zona,
    c.Direccion
FROM
    Contactos_Nuevos_SFTP_170826_2 c
    INNER JOIN _Sent s ON LOWER(LTRIM(RTRIM(c.Correo))) = LOWER(LTRIM(RTRIM(s.SubscriberKey)))
WHERE
    c.Correo IS NOT NULL
    AND LTRIM(RTRIM(c.Correo)) <> ''
