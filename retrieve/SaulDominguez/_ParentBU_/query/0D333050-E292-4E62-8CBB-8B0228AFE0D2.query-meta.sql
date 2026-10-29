SELECT
    NEWID() AS Contact_Id,
    data.Telefono,
    data.Correo,
    data.Nombre,
    data.Apellido,
    data.Colonia,
    data.Sucursal,
    data.[Numero Sucursal],
    data.[Red Social],
    data.Locale
FROM
    DATA_MANUAL_MERCO AS data
    LEFT JOIN DATA_MANUAL_MERCO_Con_Llave AS bbdg ON bbdg.Correo = data.Correo
    OR bbdg.Telefono = data.Telefono
WHERE
    bbdg.Correo IS NULL
    OR bbdg.Telefono IS NULL
