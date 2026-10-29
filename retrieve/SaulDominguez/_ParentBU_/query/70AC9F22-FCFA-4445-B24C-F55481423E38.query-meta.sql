SELECT
    NEWID() AS Contact_Id,
    nue.Email,
    nue.Nombre,
    nue.Apellido,
    nue.Telefono AS Phone,
    nue.Sucursal,
    nue.NumSucursal
FROM
    Nuevos nue
