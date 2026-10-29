SELECT
    A.*
FROM
    BDD_General_Completa A
WHERE
    Sucursal IN (
        'Saltillo Centro',
        'Urdiñola',
        'Manantiales',
        'Sendero',
        'Otilio'
    )
    OR Zona IN ('Zona Saltillo')
    AND Phone IS NOT NULL
    AND Email IS NOT NULL
