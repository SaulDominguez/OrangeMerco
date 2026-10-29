SELECT
    Contact_Id,
    CASE
        WHEN Estado = 'Nuevo León' THEN 1
        WHEN Estado IS NULL
        AND Phone LIKE '5281%' THEN 1
        ELSE 0
    END AS ClienteNL
FROM
    BDD_General_Completa
