SELECT
    gnrl.Contact_Id,
    gnrl.Email,
    reg.Nombre,
    reg.Apellido,
    reg.Telefono AS Phone,
    reg.Fecha_Nacimiento AS FechaNacimiento,
    reg.No_Tienda AS NumSucursal
FROM
    [FIESTONONON_Registros] reg
    INNER JOIN [BDD_General] gnrl ON reg.Correo = gnrl.Email
WHERE
    reg.[Opt-in] = 1
