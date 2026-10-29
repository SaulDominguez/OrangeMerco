SELECT
    Celular,
    Correo,
    RIGHT(Celular, 10) AS Telefono_10,
    CONCAT('52', RIGHT(Celular, 10)) AS Phone_52
FROM
    Contactos_Nuevos_SFTP_170826
