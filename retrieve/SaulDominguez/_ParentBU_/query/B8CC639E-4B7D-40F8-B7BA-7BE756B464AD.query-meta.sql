SELECT
    bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone,
    bdg.Sucursal,
    bdg.NumSucursal,
    bdg.FechaNacimiento
FROM
    [New_FIESTONONON_Optin] bdg
WHERE
    bdg.Email IS NOT NULL
UNION
SELECT
    bdg2.Contact_Id,
    bdg2.Email,
    bdg2.Nombre,
    bdg2.Apellido,
    bdg2.Phone,
    bdg2.Sucursal,
    bdg2.NumSucursal,
    bdg2.FechaNacimiento
FROM
    [Update_FIESTONONON_Optin] bdg2
WHERE
    bdg2.Email IS NOT NULL
