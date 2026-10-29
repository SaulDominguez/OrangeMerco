SELECT
    n.Contact_Id,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                [Extract_Carga_SFTP] e
            WHERE
                e.ContactKey = n.Contact_Id
                AND LTRIM(RTRIM(e.Status)) = 'read'
        ) THEN 1
        ELSE 0
    END AS Top_Customer
FROM
    [ORA_BDD_Solo_NL] n
