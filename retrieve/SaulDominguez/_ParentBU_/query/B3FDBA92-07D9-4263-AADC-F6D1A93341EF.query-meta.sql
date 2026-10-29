SELECT
    b.*
FROM
    BDD_General_Completa b
    INNER JOIN WA_Read_Engagement_Check w ON b.Contact_Id = w.ContactKey
