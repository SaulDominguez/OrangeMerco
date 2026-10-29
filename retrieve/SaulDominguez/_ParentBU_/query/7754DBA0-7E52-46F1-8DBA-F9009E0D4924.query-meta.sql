SELECT
    bg.Contact_Id,
    bg.Email,
    bg.Nombre,
    bg.Apellido,
    bg.Phone,
    bg.Sucursal,
    bg.NumSucursal,
    bg.FechaNacimiento,
    bg.Locale,
    bg.Genero,
    bg.Estado,
    bg.Ciudad,
    bg.MedioComunicacion,
    bg.Frecuencia,
    bg.Colonia,
    COALESCE(cms._OptinStatusID, 2) AS OptInWhatsapp,
    COALESCE(cms._OptOutStatusID, 0) AS OptOutWhatsapp
FROM
    BDD_General bg
    LEFT JOIN _ChatMessagingSubscription cms ON cms._MobileNumber = bg.Phone
WHERE
    bg.Phone IS NOT NULL
