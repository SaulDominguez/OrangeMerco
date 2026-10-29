SELECT
    bddg.Contact_Id,
    bddg.Email,
    bddg.Nombre,
    bddg.Phone,
    bddg.NumSucursal,
    bddg.Locale
FROM
    BDD_General AS bddg
WHERE
    bddg.Phone != 'null'
    AND bddg.Locale != 'null'
