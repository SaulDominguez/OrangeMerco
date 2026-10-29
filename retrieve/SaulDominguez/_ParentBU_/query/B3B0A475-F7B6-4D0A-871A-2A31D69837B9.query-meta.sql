SELECT
    Contact_Id,
    CASE
        WHEN LEN(Phone) = 10 THEN '52' + Phone
        ELSE Phone
    END AS Phone
FROM
    BDD_General
