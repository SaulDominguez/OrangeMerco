SELECT
    SubscriberKey,
    Puntos,
    EntryDate
FROM
    (
        SELECT
            SubscriberKey,
            Puntos,
            EntryDate,
            ROW_NUMBER() OVER (
                PARTITION BY
                    SubscriberKey
                ORDER BY
                    Puntos DESC,
                    EntryDate DESC
            ) AS rn
        FROM
            Ora_Pre_Fiestononon
        WHERE
            Puntos >= 4
    ) x
WHERE
    rn = 1
