SELECT
    *
FROM
    BDD_General_Completa
WHERE
    Zona IN (
        'Zona Monclova',
        'Zona Saltillo',
        'Zona Nuevo Leon'
    )
    OR Sucursal IN (
        'Piedras Negras',
        'Merco Piedras Negras',
        '510 Piedras Negras'
    )
