SELECT
    Contact_Id,
    CASE
        WHEN Phone IS NOT NULL
        AND LTRIM(RTRIM(Phone)) <> '' THEN 1
        ELSE 0
    END AS Tiene_Telefono,
    CASE
        WHEN Email IS NOT NULL
        AND LTRIM(RTRIM(Email)) <> '' THEN 1
        ELSE 0
    END AS Tiene_Correo,
    CASE
        WHEN Phone IS NOT NULL
        AND LTRIM(RTRIM(Phone)) <> ''
        AND Email IS NOT NULL
        AND LTRIM(RTRIM(Email)) <> '' THEN 1
        ELSE 0
    END AS Tiene_Ambos
FROM
    [BDD_General_Completa]
