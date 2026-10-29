SELECT
    NEWID() AS Contact_Id,
    reg.Correo AS Email,
    reg.Nombre,
    reg.Apellido,
    reg.Telefono AS Phone,
    reg.Fecha_Nacimiento AS FechaNacimiento,
    reg.No_Tienda AS NumSucursal
FROM
    [FIESTONONON_Registros] reg
    LEFT JOIN [Update_FIESTONONON_Optin] gnrl ON gnrl.Email = reg.Correo
    OR gnrl.Phone = reg.Telefono
    LEFT JOIN [New_FIESTONONON_Optin] new ON new.Email = reg.Correo
    OR new.Phone = reg.Telefono
WHERE
    gnrl.Contact_Id IS NULL
    AND new.Contact_Id IS NULL
    AND reg.[Opt-in] = 1
