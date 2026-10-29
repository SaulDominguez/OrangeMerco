SELECT
    Contact_Id,
    CASE
        WHEN Zona LIKE '%Saltillo%' THEN 1
        WHEN Zona IS NULL
        AND Phone LIKE '52844%' THEN 1
        ELSE 0
    END AS ClienteSALT,
    CASE
        WHEN Zona LIKE '%Piedras Negras%'
        OR Zona LIKE '%Monclova%'
        OR Zona LIKE '%Carbonifera%' THEN 1
        WHEN Zona IS NULL
        AND (
            Phone LIKE '52866%'
            OR Phone LIKE '52878%'
        ) THEN 1
        ELSE 0
    END AS ClienteMVA_CARB_PN
FROM
    BDD_General_Completa
