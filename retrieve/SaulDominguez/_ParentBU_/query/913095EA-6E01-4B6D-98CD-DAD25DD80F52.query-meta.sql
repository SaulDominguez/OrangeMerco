SELECT
    nombres,
    apellidos,
    Contact_Id,
    created_at,
    telefono,
    'MX' AS Locale
FROM
    (
        SELECT
            nombres,
            apellidos,
            Contact_Id,
            created_at,
            telefono,
            'MX' AS Locale,
            ROW_NUMBER() OVER (
                PARTITION BY
                    Contact_Id
                ORDER BY
                    created_at DESC
            ) AS rn
        FROM
            (
                SELECT
                    *
                FROM
                    Fiestononon_2025_General
                UNION ALL
                SELECT
                    *
                FROM
                    Fiestononon_2025_General_BKP_28102025
            ) AS combined
    ) AS final
WHERE
    rn = 1
