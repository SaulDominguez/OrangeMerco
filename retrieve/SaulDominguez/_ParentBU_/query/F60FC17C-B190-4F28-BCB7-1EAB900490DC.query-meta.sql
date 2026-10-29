SELECT
    b.*
FROM
    BDD_General_Completa b
    INNER JOIN WA_SENT_MERCO_260126 w ON b.Contact_Id = w.ContactKey
