SELECT
    r2.Ticket,
    r2.No_Tienda,
    r2.Nombre,
    r2.Apellido,
    r2.Correo,
    r2.Telefono,
    r2.Fecha_Compra,
    r2.Monto_Ticket,
    g.Contact_Id
FROM
    FIESTONONON_Registros_n2 r2
    INNER JOIN BDD_General g ON r2.Correo = g.Email
