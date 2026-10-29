SELECT
    *
FROM
    BDD_General_Completa
WHERE
    Sucursal IN (
        'Piedras Negras',
        'Merco Piedras Negras',
        '510 Piedras Negras'
    )
    AND Phone IS NOT NULL
