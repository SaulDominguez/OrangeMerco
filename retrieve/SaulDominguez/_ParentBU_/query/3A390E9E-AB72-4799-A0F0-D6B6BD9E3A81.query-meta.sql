SELECT
    bgpp.*
FROM
    BDD_General bgpp
    LEFT JOIN [001_Progressive_Profiling_Registros_Nuevos] r1 ON bgpp.Contact_Id = r1.Contact_Id
    LEFT JOIN [002_Progressive_Profiling_Registros_Existentes] r2 ON bgpp.Contact_Id = r2.Contact_Id
WHERE
    r1.Contact_Id IS NULL
    AND r2.Contact_Id IS NULL
    AND bgpp.Email != ''
