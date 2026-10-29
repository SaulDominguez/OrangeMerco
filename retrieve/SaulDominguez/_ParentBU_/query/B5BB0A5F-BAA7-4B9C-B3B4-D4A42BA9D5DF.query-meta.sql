SELECT
    fn.Email,
    fn.Phone,
    fn.Contact_Id
FROM
    BDD_General_Datawifi fn
    LEFT JOIN BDD_General bg ON bg.Contact_Id = fn.Contact_Id
WHERE
    bg.Contact_Id IS NULL
