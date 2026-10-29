SELECT
    Email,
    nombres,
    apellidos,
    created_at,
    telefono,
    Locale,
    Contact_Id,
    CONCAT('52', telefono) AS Telefono_52
FROM
    (
        SELECT
            Email,
            nombres,
            apellidos,
            created_at,
            telefono,
            Locale,
            Contact_Id,
            ROW_NUMBER() OVER (
                PARTITION BY
                    telefono
                ORDER BY
                    Contact_Id ASC
            ) AS rn
        FROM
            Fiestononon_2025_General
    ) AS t
WHERE
    rn = 1
