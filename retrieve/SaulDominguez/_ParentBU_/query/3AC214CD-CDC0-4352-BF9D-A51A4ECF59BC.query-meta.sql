SELECT
    rcp.Contact_Id,
    rcp.Email
FROM
    [BDD_General] rcp
    INNER JOIN (
        SELECT
            snt.[SubscriberKey],
            snt.TriggererSendDefinitionObjectId,
            snt.[EventDate],
            snt.JobID,
            j.JourneyName,
            jb.EmailName,
            ROW_NUMBER() OVER (
                PARTITION BY
                    snt.[SubscriberKey],
                    j.JourneyName
                ORDER BY
                    snt.[EventDate] DESC
            ) AS ROWsnt
        FROM
            _Sent snt
            LEFT JOIN _Job jb ON jb.JobID = snt.JobID
            LEFT JOIN _JourneyActivity ja ON snt.TriggererSendDefinitionObjectId = ja.JourneyActivityObjectID
            LEFT JOIN _Journey j ON ja.VersionID = j.VersionID
        WHERE
            j.JourneyName = 'IP - Warming - Pieza 6'
    ) AS st ON st.[SubscriberKey] = rcp.Contact_Id
WHERE
    st.ROWsnt = 1
