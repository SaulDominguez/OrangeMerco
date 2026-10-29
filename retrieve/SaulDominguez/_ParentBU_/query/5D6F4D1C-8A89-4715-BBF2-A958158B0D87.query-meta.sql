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
    CASE
        WHEN Ciudad IN (
            'Escobedo',
            'Monterrey',
            'Santa Catarina',
            'Apodaca',
            'General Zuazua',
            'Montemorelos',
            'Cadereyta',
            'Guadalupe',
            'El Carmen',
            'Pesquería',
            'Santa Catarina',
            'García',
            'Salinas Victoria',
            'Juárez'
        ) THEN 'Zona NL'
        WHEN Ciudad IN ('Saltillo', 'Ramos Arizpe', 'Parras de la fuente') THEN 'Zona Saltillo'
        WHEN Ciudad IN (
            'Castaños',
            'San Juan de Sabinas',
            'San Buenaventura',
            'Monclova',
            'Acuña',
            'Piedras Negras',
            'Frontera'
        ) THEN 'Zona Monclova y Carbonifera'
        ELSE 'Sin especificar'
    END AS Zona
FROM
    BDD_General bg
    LEFT JOIN _Subscribers sb ON bg.Contact_Id = sb.SubscriberKey
WHERE
    sb.Status != 'unsubscribed'
    AND sb.status != 'held'
