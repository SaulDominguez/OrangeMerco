SELECT
    g.Telefono,
    g.Nombre,
    g.Apellidos,
    g.Zona,
    g.Tickets_participantes,
    g.Sucursal_preferida,
    g.Ultimo_registro,
    g.Primer_registro,
    b.Contact_Id,
    b.Locale,
    'NL' AS Tipo_Ganador
FROM
    Ganadores_NL_Tickets g
    INNER JOIN BDD_General_Completa b ON g.Telefono = b.Phone
UNION ALL
SELECT
    g.Telefono,
    g.Nombre,
    g.Apellidos,
    g.Zona,
    g.Tickets_participantes,
    g.Sucursal_preferida,
    g.Ultimo_registro,
    g.Primer_registro,
    b.Contact_Id,
    b.Locale,
    'MC' AS Tipo_Ganador
FROM
    Ganadores_MC_Tickets g
    INNER JOIN BDD_General_Completa b ON g.Telefono = b.Phone
