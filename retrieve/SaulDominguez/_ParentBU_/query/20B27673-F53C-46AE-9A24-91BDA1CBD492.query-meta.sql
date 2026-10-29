SELECT
    Nombre,
    Telefono,
    Correo,
    [Colonia donde vive],
    [Donde hace su despensa],
    CASE
        WHEN Telefono LIKE '52%' THEN Telefono
        ELSE CONCAT('52', Telefono)
    END AS Phone_52,
    'MX' AS Locale
FROM
    Clientes_Saltillo
