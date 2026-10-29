SELECT
    gnrl.Contact_Id,
    reg.Correo AS Email,
    reg.Nombre,
    reg.Apellido,
    reg.Telefono AS Phone,
    reg.Fecha_Nacimiento AS FechaNacimiento,
    reg.No_Tienda AS NumSucursal
FROM
    [FIESTONONON_Registros] reg
    INNER JOIN [BDD_General] gnrl ON gnrl.Phone LIKE CONCAT('%', reg.Telefono)
WHERE
    reg.[Opt-in] = 1
    AND gnrl.Phone IS NOT NULL
