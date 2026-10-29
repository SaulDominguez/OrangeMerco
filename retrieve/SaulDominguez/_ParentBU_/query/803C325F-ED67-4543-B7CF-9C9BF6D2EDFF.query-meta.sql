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
    bg.OptInWhatsapp,
    CONCAT(
        CASE
            WHEN sb.Status NOT IN ('held', 'unsubscribed') THEN CONCAT('Email', Char(59))
            ELSE ''
        END,
        CASE
            WHEN cms._OptOutStatusID != 2 THEN CONCAT('Whatsapp', Char(59), 'SMS')
            ELSE ''
        END
    ) AS PosibleMedioComunicacion
FROM
    BDD_General bg
    LEFT JOIN _Subscribers sb ON bg.Contact_Id = sb.SubscriberKey
    LEFT JOIN _ChatMessagingSubscription cms ON bg.Phone = cms._MobileNumber
