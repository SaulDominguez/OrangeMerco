SELECT
    o.*
FROM
    BDD_WA_Opens o
    LEFT JOIN BDD_General_VIP v ON o.Contact_Id = v.Contact_Id
WHERE
    v.Contact_Id IS NULL
