SELECT
    b.*
FROM
    BDD_General_Completa b
    INNER JOIN Errores_Envio_WA_EngagementCheck e ON b.Contact_Id = e.ContactKey
