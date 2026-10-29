SELECT
    r2.Ticket,
    r2.No_Tienda,
    r2.Nombre,
    r2.Apellido,
    r2.Correo,
    r2.Telefono,
    r2.Fecha_Compra,
    r2.Monto_Ticket,
    NEWID() AS Id
FROM
    FIESTONONON_Registros_n2 r2
    LEFT JOIN BDD_General g ON r2.Correo = g.Email
    LEFT JOIN Whatsapp_Subscribers w ON r2.Telefono = w.Mobilenumber
WHERE
    g.Email IS NULL
    AND w.Mobilenumber IS NULL
