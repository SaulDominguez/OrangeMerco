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
    bg.Zona
FROM
    BDD_General_Segmentada_Zona bg
    LEFT JOIN _Subscribers sb ON bg.Contact_Id = sb.SubscriberKey
WHERE
    sb.Status != 'unsubscribed'
    AND sb.status != 'held'
    AND bg.Zona = 'Zona NL'
    OR bg.Zona = 'Zona Saltillo'
