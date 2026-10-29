SELECT
    r2.Ticket,
    r2.No_Tienda,
    r2.Nombre,
    r2.Apellido,
    r2.Correo,
    r2.Telefono,
    r2.Fecha_Compra,
    r2.Monto_Ticket,
    w.Contactkey
FROM
    FIESTONONON_Registros_n2 r2
    JOIN Whatsapp_Subscribers w ON r2.Telefono = w.Mobilenumber
