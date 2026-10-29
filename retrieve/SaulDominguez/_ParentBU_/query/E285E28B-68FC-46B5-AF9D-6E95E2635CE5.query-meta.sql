SELECT
    Contact_Id,
    CASE
        WHEN LEFT(Phone, 3) = '521' THEN '52' + SUBSTRING(Phone, 2, LEN(Phone) - 1)
        ELSE Phone
    END AS Phone
FROM
    BDD_General
