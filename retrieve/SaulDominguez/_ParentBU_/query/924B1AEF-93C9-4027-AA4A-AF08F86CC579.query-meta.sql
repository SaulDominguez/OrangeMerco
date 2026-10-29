SELECT
    j.JourneyName,
    COUNT(
        CASE
            WHEN wa.Status = 'SENT' THEN 1
            ELSE NULL
        END
    ) AS [Sent],
    COUNT(
        CASE
            WHEN wa.Status = 'delivered' THEN 1
        END
    ) AS [Delivered],
    COUNT(
        CASE
            WHEN wa.Status = 'read' THEN 1
        END
    ) AS [Read]
FROM
    Extract_WhatsApp wa
    INNER JOIN _JourneyActivity ja ON ja.ActivityId = wa.jbActivityId
    INNER JOIN _Journey j ON j.VersionID = ja.VersionID
WHERE
    ja.ActivityType = 'WHATSAPPACTIVITY'
    AND (
        wa.Status = 'SENT' COLLATE Latin1_General_CS_AS
        OR wa.Status = 'delivered'
        OR wa.Status = 'read'
    )
GROUP BY
    j.JourneyName
