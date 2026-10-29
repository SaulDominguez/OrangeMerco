SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Locale,
    b.FechaNacimiento,
    b.Sucursal,
    b.NumSucursal,
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
    b.Zona
FROM
    BDD_General b
UNION
SELECT
    f.Contact_Id,
    f.Email,
    f.nombres AS Nombre,
    f.apellidos AS Apellido,
    f.telefono AS Phone,
    f.Locale,
    NULL AS FechaNacimiento,
    NULL AS Sucursal,
    NULL AS NumSucursal,
    NULL AS Genero,
    NULL AS Estado,
    NULL AS Ciudad,
    NULL AS MedioComunicacion,
    NULL AS Frecuencia,
    NULL AS Colonia,
    NULL AS OptInWhatsapp,
    NULL AS frutasVerduras,
    NULL AS Salchichoneria,
    NULL AS CarnesPescados,
    NULL AS Panaderia,
    NULL AS abarrotes,
    NULL AS articulosBebe,
    NULL AS bebidas,
    NULL AS higieneCuidadoPersonal,
    NULL AS MercanciasGenerales,
    NULL AS OptOutWhatsapp,
    NULL AS Zona
FROM
    Fiestononon_2025_General_BKP_Completo f
WHERE
    f.telefono NOT IN (
        SELECT
            Phone
        FROM
            BDD_General
        WHERE
            Phone IS NOT NULL
    )
