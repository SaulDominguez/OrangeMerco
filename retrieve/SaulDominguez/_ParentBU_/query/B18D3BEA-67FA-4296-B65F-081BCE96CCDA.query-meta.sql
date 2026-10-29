SELECT
    uq.ContactKey,
    uq.MobileNumber,
    uq.EventDateUTC,
    uq.Status,
    uq.Reason,
    uq.SendIdentifier,
    uq.ActivityName,
    uq.JourneyName,
    uq.RowNo
FROM
    (
        SELECT
            b.ContactKey,
            b.MobileNumber,
            b.EventDateUTC,
            b.SendIdentifier,
            b.Status,
            b.Reason,
            b.ActivityName,
            jn.JourneyName,
            ROW_NUMBER() OVER (
                PARTITION BY
                    b.SendIdentifier
                ORDER BY
                    b.EventDateUTC DESC
            ) AS RowNo
        FROM
            WhatsappSendsRaw AS b
            LEFT JOIN _Journey AS jn ON b.JbDefinitionId = jn.JourneyID
    ) AS uq
WHERE
    RowNo = 1
