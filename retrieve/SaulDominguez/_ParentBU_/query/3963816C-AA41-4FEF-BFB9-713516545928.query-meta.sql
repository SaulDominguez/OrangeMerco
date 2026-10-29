SELECT
    NEWID() AS SubscriberKey,
    tsp.Email,
    tsp.Nombre,
    tsp.Apellido,
    tsp.Phone
FROM
    TEMP_SUPERMERCADOSMERCO tsp
