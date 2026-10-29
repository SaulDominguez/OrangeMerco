SELECT
    g.*,
    s.Sucursal AS Sucursal_Domicilio
FROM
    BDD_General_Completa g
    INNER JOIN Sucursales_domicilio s ON g.Sucursal = s.Nombre_Sucursal
