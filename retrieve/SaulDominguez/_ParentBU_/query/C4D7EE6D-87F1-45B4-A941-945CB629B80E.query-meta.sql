SELECT DISTINCT
    c.Nombres,
    c.Apellidos,
    c.Fecha_de_nacimiento,
    c.Celular,
    c.Direccion,
    c.Codigo_de_Direccion,
    c.Territorio,
    c.Zona,
    c.Correo,
    c.Phone_52,
    c.Locale,
    NEWID() AS GUID
FROM
    Contactos_Nuevos_SFTP_170826_2 c
    INNER JOIN Extract_Carga_SFTP e ON LOWER(LTRIM(RTRIM(c.Correo))) = LOWER(LTRIM(RTRIM(e.ContactKey)))
WHERE
    c.Correo IS NOT NULL
    AND LTRIM(RTRIM(c.Correo)) <> ''
