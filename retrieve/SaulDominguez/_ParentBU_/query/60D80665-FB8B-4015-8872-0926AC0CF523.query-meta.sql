SELECT
    bdg.Contact_Id,
    bdg.Email,
    bdg.Nombre,
    bdg.Apellido,
    bdg.Phone,
    bdg.Sucursal,
    bdg.NumSucursal,
    bdg.FechaNacimiento,
    bdg.Locale,
    bdg.Genero,
    bdg.Estado,
    bdg.Ciudad,
    bdg.MedioComunicacion,
    bdg.Frecuencia
FROM
    BDD_General bdg
    INNER JOIN DeleteContact dc ON dc.SubscriberKey = bdg.Contact_Id
