SELECT
    bg.Contact_Id,
    bg.Num_BuenFin,
    ck.JourneyName AS [Journey Name],
    1 AS [Click],
    CASE
        WHEN ck.IsUnique = 'TRUE' THEN 1
    END AS [Unique Click]
FROM
    BDD_General bg
    INNER JOIN (
        SELECT
            clk.SubscriberKey,
            clk.TriggererSendDefinitionObjectId,
            clk.EventDate,
            clk.JobID,
            j.JourneyName,
            jb.EmailName,
            clk.IsUnique,
            ROW_NUMBER() OVER (
                PARTITION BY
                    clk.SubscriberKey,
                    j.JourneyName
                ORDER BY
                    clk.EventDate DESC
            ) AS ROWclk
        FROM
            _Click clk
            LEFT JOIN _JourneyActivity ja ON clk.TriggererSendDefinitionObjectId = ja.JourneyActivityObjectID
            LEFT JOIN _Journey j ON j.VersionID = ja.VersionID
            LEFT JOIN _Job jb ON jb.JobID = clk.JobID
        WHERE
            j.JourneyName LIKE '%Buen-Fin-17-11-2023%'
    ) AS ck ON ck.SubscriberKey = bg.Contact_Id
WHERE
    ck.ROWclk = 1
