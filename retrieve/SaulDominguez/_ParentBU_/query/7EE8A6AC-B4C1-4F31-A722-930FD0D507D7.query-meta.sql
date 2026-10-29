SELECT
    ws.Contact_Id,
    ws.Email,
    ws.Phone
FROM
    BDD_General_Datawifi ws
    INNER JOIN BDD_General bg ON bg.Contact_Id = ws.Contact_Id
