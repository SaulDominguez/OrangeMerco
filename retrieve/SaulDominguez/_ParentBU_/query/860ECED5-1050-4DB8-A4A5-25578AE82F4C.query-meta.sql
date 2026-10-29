SELECT
    ActivityName,
    COUNT(ContactKey) AS Sends,
    COUNT(
        CASE
            WHEN LOWER(Status) = 'delivered' THEN ContactKey
        END
    ) AS Deliveries,
    COUNT(
        CASE
            WHEN LOWER(Status) = 'read' THEN ContactKey
        END
    ) AS Opens,
    COUNT(
        CASE
            WHEN LOWER(Status) NOT IN ('sent', 'read', 'delivered') THEN ContactKey
        END
    ) AS Bounces
FROM
    WhatsappBounces
WHERE
    ActivityName IS NOT NULL
GROUP BY
    ActivityName
