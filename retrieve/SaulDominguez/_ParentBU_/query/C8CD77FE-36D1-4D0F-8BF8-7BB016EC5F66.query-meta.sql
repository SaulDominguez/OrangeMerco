SELECT
    o.SubscriberKey AS Contact_Id,
    o.Email,
    o.Nombre,
    o.Apellido,
    o.Sucursal,
    o.FrutasVerduras_Ofertas AS frutasVerduras,
    o.SalchichoneriaLacteos_Ofertas AS Salchichoneria,
    o.Carnes_Ofertas AS CarnesPescados,
    o.Abarrotes_Ofertas AS abarrotes,
    o.Bebes_Ofertas AS articulosBebe,
    o.BellezaCuidado_Ofertas AS higieneCuidadoPersonal,
    o.MercanciasGenerales_Ofertas AS MercanciasGenerales,
    o.DateModified,
    o.ServicioDomicilio
FROM
    Ora_Engagement_Check_Registros o
    INNER JOIN BDD_General_Completa b ON o.SubscriberKey = b.Contact_Id
