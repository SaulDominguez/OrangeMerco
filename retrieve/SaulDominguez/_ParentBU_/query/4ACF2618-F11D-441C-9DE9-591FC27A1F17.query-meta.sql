SELECT
    b.*
FROM
    BDD_General_Completa b
    INNER JOIN Extract_WA_310826 e ON b.Contact_Id = e.ContactKey
