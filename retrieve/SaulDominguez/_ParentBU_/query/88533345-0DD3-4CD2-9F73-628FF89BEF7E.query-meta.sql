SELECT
    Contact_Id,
    Email,
    Nombre,
    Apellido,
    Phone,
    Sucursal,
    NumSucursal,
    FechaNacimiento,
    Locale,
    Genero,
    Estado,
    Ciudad,
    MedioComunicacion,
    Frecuencia,
    Colonia,
    OptInWhatsapp,
    frutasVerduras,
    Salchichoneria,
    CarnesPescados,
    Panaderia,
    abarrotes,
    articulosBebe,
    bebidas,
    higieneCuidadoPersonal,
    MercanciasGenerales,
    OptOutWhatsapp,
    Zona,
    (
        ROW_NUMBER() OVER (
            ORDER BY
                Contact_Id
        )
    ) % 30 AS Dia
FROM
    BDD_General
WHERE
    OptOutWhatsapp = 0
