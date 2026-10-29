SELECT
    A.*
FROM
    BDD_General_Completa A
WHERE
    (
        Sucursal IN (
            'Saltillo Centro',
            '577_SaltilloSendero',
            'Merco Saltillo Centro',
            'Urdiñola',
            'Merco Urdiñola',
            'Urdi?ola',
            '561_Urdiñola',
            'Manantiales',
            '562_Manantiales',
            'Merco Manantiales',
            'Sendero',
            'Merco Sendero Sur',
            'Sendero Sur',
            'Otilio',
            'Merco Otilio'
        )
        OR Zona IN ('Zona Saltillo')
    )
    AND Phone IS NOT NULL
    AND Email IS NOT NULL
    AND Email != ''
