SELECT
    bg.Contact_Id,
    bg.Num_BuenFin,
    st.JourneyName AS [Journey Name],
    st.EmailName AS [Email Name],
    st.JobID AS [Job ID],
    st.EventDate AS [Sent Date],
    1 AS [Sent]
FROM
    BDD_General bg
    INNER JOIN (
        SELECT
            snt.SubscriberKey,
            snt.TriggererSendDefinitionObjectId,
            snt.EventDate,
            snt.JobID,
            j.JourneyName,
            jb.EmailName,
            ROW_NUMBER() OVER (
                PARTITION BY
                    snt.SubscriberKey,
                    j.JourneyName
                ORDER BY
                    snt.EventDate DESC
            ) AS ROWsnt
        FROM
            _Sent snt
            LEFT JOIN _JourneyActivity ja ON snt.TriggererSendDefinitionObjectId = ja.JourneyActivityObjectID
            LEFT JOIN _Journey j ON j.VersionID = ja.VersionID
            LEFT JOIN _Job jb ON jb.JobID = snt.JobID
        WHERE
            j.JourneyName LIKE '%Buen-Fin-17-11-2023%'
    ) AS st ON st.SubscriberKey = bg.Contact_Id
WHERE
    st.ROWsnt = 1
