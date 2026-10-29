SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.NumSucursal,
    b.FechaNacimiento,
    b.Locale,
    b.Genero,
    b.Estado,
    b.Ciudad,
    b.MedioComunicacion,
    b.Frecuencia,
    b.Colonia,
    b.OptInWhatsapp,
    b.frutasVerduras,
    b.Salchichoneria,
    b.CarnesPescados,
    b.Panaderia,
    b.abarrotes,
    b.articulosBebe,
    b.bebidas,
    b.higieneCuidadoPersonal,
    b.MercanciasGenerales,
    b.OptOutWhatsapp,
    b.Zona,
    b.NoRecibirComunicacion,
    b.ClienteNL,
    b.ClienteSALT,
    b.ClienteMVA_CARB_PN,
    b.DateModified,
    b.ServicioDomicilio,
    b.WA_VIP,
    b.WA_ALL,
    b.SMS_codigo_entry
FROM
    BDD_General_Completa b
    INNER JOIN SMS_codigo_App s ON b.Contact_Id = s.SubscriberKey
    LEFT JOIN Ora_Pre_Fiestononon p ON b.Contact_Id = p.SubscriberKey
WHERE
    p.SubscriberKey IS NULL
