SELECT
    nombres,
    apellidos,
    Contact_Id,
    created_at,
    telefono,
    Locale,
    Email
FROM
    (
        SELECT
            nombres,
            apellidos,
            Contact_Id,
            created_at,
            telefono,
            Locale,
            Email,
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
                    Fiestononon_2025_General_BKP_28102025
                UNION ALL
                SELECT
                    *
                FROM
                    Fiestononon_2025_General_BKP_101125
                UNION ALL
                SELECT
                    *
                FROM
                    Fiestononon_2025_General_BKP_total_hasta_081125
                UNION ALL
                SELECT
                    *
                FROM
                    Fiestononon_2025_General_BKP_12112025
                UNION ALL
                SELECT
                    *
                FROM
                    Fiestononon_2025_General_BKP_241125
            ) AS all_data
    ) AS dedup
WHERE
    rn = 1
