SELECT
    Contact_Id,
    (
        CASE
            WHEN (
                CASE
                    WHEN Sucursal LIKE '[0-9][0-9][0-9]%' THEN LEFT(LEN(SUCURSAL), 4)
                    WHEN Sucursal LIKE 'Merco%' THEN RIGHT(Sucursal, LEN(Sucursal) - 6)
                    ELSE Sucursal
                END
            ) IN (
                'Parras',
                'Saltillo Centro',
                'Urdiñola',
                'Manantiales',
                'Ramos Arizpe',
                'Otilio',
                'Sendero Sur',
                'Madero'
            ) THEN 'Zona Saltillo'
            WHEN (
                CASE
                    WHEN Sucursal LIKE '[0-9][0-9][0-9]%' THEN RIGHT(Sucursal, LEN(Sucursal) - 4)
                    WHEN Sucursal LIKE 'Merco%' THEN RIGHT(Sucursal, LEN(Sucursal) - 6)
                    ELSE Sucursal
                END
            ) IN (
                'Cadereyta',
                'Montemorelos',
                'Pueblo Nuevo',
                'Solidaridad',
                'Mixcoac',
                'Nuevo Repueblo',
                'Aramberri',
                'García',
                'Garcia',
                'Linda Vista',
                'Lindavista',
                'Sendero Santa Catarina',
                'Santa Catarina',
                'Buena Vista',
                'Buenavista',
                'San Roque',
                'Los Pilares',
                'Colinas del Aeropuerto',
                'Colinas',
                'Girasoles / Escobedo',
                'Escobedo',
                'Israel Cavazos',
                'Paraje San José',
                'Paraje San Jose',
                'Santa Elena',
                'Mirador de San Antonio',
                'Apodaca Centro',
                'El Jaral'
            ) THEN 'Zona Nuevo Leon'
            WHEN (
                CASE
                    WHEN Sucursal LIKE '[0-9][0-9][0-9]%' THEN RIGHT(Sucursal, LEN(Sucursal) - 4)
                    WHEN Sucursal LIKE 'Merco%' THEN RIGHT(Sucursal, LEN(Sucursal) - 6)
                    ELSE Sucursal
                END
            ) IN (
                'Hidalgo',
                'Frontera',
                'San Buena',
                'Castaños',
                'Sierrita',
                'Paseo Monclova'
            ) THEN 'Zona Monclova'
            WHEN (
                CASE
                    WHEN Sucursal LIKE '[0-9][0-9][0-9]%' THEN RIGHT(Sucursal, LEN(Sucursal) - 4)
                    WHEN Sucursal LIKE 'Merco%' THEN RIGHT(Sucursal, LEN(Sucursal) - 6)
                    ELSE Sucursal
                END
            ) IN (
                'Rosita',
                'Piedras Negras',
                'Acuña',
                'Libramiento',
                'Sierrita',
                'La Sierrita',
                'Libramiento',
                'Paseo Monclova'
            ) THEN 'Zona Carbonifera'
            ELSE ''
        END
    ) AS Zona
FROM
    BDD_General
