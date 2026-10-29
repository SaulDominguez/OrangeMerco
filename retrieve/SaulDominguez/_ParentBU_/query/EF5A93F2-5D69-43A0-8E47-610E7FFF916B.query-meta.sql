SELECT
    a.Telefono,
    a.Codigo,
    a.SalesForceId,
    a.Estado,
    a.Coincide_Telefono,
    a.Coincide_SalesForceId,
    a.Coincide_Codigo,
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.Estado AS Estado_BDD,
    b.Ciudad
FROM
    [Registros_no_coincidentes_totales] a
    INNER JOIN [BDD_General_Completa] b ON a.SalesForceId = b.Contact_Id
