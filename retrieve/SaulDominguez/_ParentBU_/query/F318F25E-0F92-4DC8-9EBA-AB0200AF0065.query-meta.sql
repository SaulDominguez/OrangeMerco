SELECT
    b.Contact_Id,
    CASE
        WHEN v.Contact_Id IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS WA_VIP,
    CASE
        WHEN w.Contact_Id IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS WA_ALL
FROM
    BDD_General_Completa b
    LEFT JOIN BDD_General_VIP v ON b.Contact_Id = v.Contact_Id
    LEFT JOIN BDD_WA_ALL w ON b.Contact_Id = w.Contact_Id
