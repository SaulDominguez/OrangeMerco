SELECT
    Contact_Id,
    CASE
        WHEN Phone LIKE '52181%'
        OR Phone LIKE '5281%' THEN 'Zona Nuevo Leon'
        WHEN Phone LIKE '52184%'
        OR Phone LIKE '5284%' THEN 'Zona Saltillo'
        WHEN Phone LIKE '52187%'
        OR Phone LIKE '5287%' THEN 'Zona Monclova'
        WHEN Phone LIKE '52186%'
        OR Phone LIKE '5286%' THEN 'Zona Carbonifera'
        ELSE Zona
    END AS Zona
FROM
    BDD_General_VIP
