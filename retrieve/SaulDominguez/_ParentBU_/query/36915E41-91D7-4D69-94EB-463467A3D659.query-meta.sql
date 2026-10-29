SELECT
    NEWID() AS Contactkey,
    wha.Telefono AS mobilenumber,
    wha.Locale
FROM
    WhastApp_Monclova wha
    LEFT JOIN Base_Fiestononon_WhastApp_Monclova bwm ON bwm.mobilenumber = wha.Telefono
WHERE
    bwm.mobilenumber IS NULL
