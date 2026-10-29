SELECT
    bg.Contact_Id,
    bg.Num_BuenFin,
    op.JourneyName AS [Journey Name],
    1 AS [Open],
    CASE
        WHEN op.IsUnique = 'TRUE' THEN 1
    END AS [Unique Open]
FROM
    BDD_General bg
    INNER JOIN (
        SELECT
            opn.SubscriberKey,
            opn.TriggererSendDefinitionObjectId,
            opn.EventDate,
            opn.JobID,
            j.JourneyName,
            jb.EmailName,
            opn.IsUnique,
            ROW_NUMBER() OVER (
                PARTITION BY
                    opn.SubscriberKey,
                    j.JourneyName
                ORDER BY
                    opn.EventDate DESC
            ) AS ROWopn
        FROM
            _Open opn
            LEFT JOIN _JourneyActivity ja ON opn.TriggererSendDefinitionObjectId = ja.JourneyActivityObjectID
            LEFT JOIN _Journey j ON j.VersionID = ja.VersionID
            LEFT JOIN _Job jb ON jb.JobID = opn.JobID
        WHERE
            j.JourneyName LIKE '%Buen-Fin-17-11-2023%'
    ) AS op ON op.SubscriberKey = bg.Contact_Id
WHERE
    op.ROWopn = 1
