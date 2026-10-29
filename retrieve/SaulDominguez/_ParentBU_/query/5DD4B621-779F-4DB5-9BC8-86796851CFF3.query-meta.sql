SELECT
    bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone,
    bdg.Sucursal,
    bdg.NumSucursal
FROM
    BDD_General_Activos bdg
    LEFT JOIN ipWarming_Base_Contactados_Pieza5 contactados ON bdg.Contact_Id = contactados.Contact_Id
WHERE
    contactados.Contact_Id IS NULL
