SELECT
    c.Contact_Id,
    c.Phone,
    c.Tiene_APP,
    c.Lista_Origen
FROM
    Clientes_Sin_Registrar c
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            TEST_BDD_General_Completa g
        WHERE
            RIGHT(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(REPLACE(LTRIM(RTRIM(g.Phone)), '+', ''), ' ', ''),
                            '-',
                            ''
                        ),
                        '(',
                        ''
                    ),
                    ')',
                    ''
                ),
                10
            ) = RIGHT(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(REPLACE(LTRIM(RTRIM(c.Phone)), '+', ''), ' ', ''),
                            '-',
                            ''
                        ),
                        '(',
                        ''
                    ),
                    ')',
                    ''
                ),
                10
            )
    )
