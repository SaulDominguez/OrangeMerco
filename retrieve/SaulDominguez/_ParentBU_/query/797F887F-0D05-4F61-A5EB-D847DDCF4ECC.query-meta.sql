SELECT
    gen.Contact_Id,
    gen.Email,
    gen.Nombre,
    gen.Apellido,
    gen.Phone,
    gen.Sucursal,
    gen.NumSucursal,
    gen.FechaNacimiento,
    gen.Locale,
    gen.Genero,
    gen.Estado,
    gen.Ciudad,
    gen.MedioComunicacion,
    gen.Frecuencia,
    gen.Colonia
FROM
    DeleteContact del
    INNER JOIN BDD_General gen ON del.SubscriberKey = gen.Contact_Id
