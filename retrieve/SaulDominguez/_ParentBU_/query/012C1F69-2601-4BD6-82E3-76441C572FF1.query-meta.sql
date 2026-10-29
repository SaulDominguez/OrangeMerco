SELECT
    Contact_Id,
    CASE
        WHEN LEFT(Phone, 2) = '52' THEN 'mx'
        ELSE NULL
    END AS Locale
FROM
    BDD_General
