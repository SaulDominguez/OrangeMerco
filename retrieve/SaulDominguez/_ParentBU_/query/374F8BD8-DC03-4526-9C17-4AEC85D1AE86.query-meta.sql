SELECT
    r.Telefono,
    r.Codigo,
    r.FechaCreacion,
    r.FechaExpiracion,
    r.ProveedorId,
    r.ProveedorMensaje,
    s.SubscriberKey,
    s.Nombre,
    s.EntryDate AS EntryDate_SMS,
    s.Source,
    s.dinamica
FROM
    [Registros_faltantes_Accord] r
    INNER JOIN [SMS_codigo_App] s ON s.Telefono = r.Telefono
    AND s.OTP = r.Codigo
