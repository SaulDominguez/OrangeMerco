SELECT
    bddg.Contact_Id,
    bddg.Email,
    bddg.Nombre,
    bddg.Apellido,
    bddg.Phone,
    bddg.Sucursal,
    bddg.NumSucursal,
    bddg.Locale
FROM
    BDD_General AS bddg
WHERE
    bddg.NumSucursal = '585'
