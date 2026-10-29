SELECT
    nl.Contact_Id,
    CASE
        WHEN w.Contact_Id IS NOT NULL THEN 1
        ELSE 0
    END AS TieneWA,
    CASE
        WHEN v.Contact_Id IS NOT NULL THEN 1
        ELSE 0
    END AS WA_VIP
FROM
    ORA_BDD_Solo_NL nl
    LEFT JOIN BDD_WA_ALL w ON nl.Contact_Id = w.Contact_Id
    LEFT JOIN BDD_General_VIP v ON nl.Contact_Id = v.Contact_Id
