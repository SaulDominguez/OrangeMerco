SELECT
    c.Correo,
    c.Phone_52,
    CASE
        WHEN b.Contact_Id IS NOT NULL THEN 1
        ELSE 0
    END AS EstaEnBDDGeneral
FROM
    Contactos_Nuevos_SFTP_170826 c
    LEFT JOIN BDD_General_Completa b ON c.Phone_52 = b.Phone
    OR LOWER(LTRIM(RTRIM(c.Correo))) = LOWER(LTRIM(RTRIM(b.Email)))
