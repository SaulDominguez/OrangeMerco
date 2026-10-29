SELECT
    ContactKey AS Contact_Id,
    COUNT(EventDateUTC) AS Bounces
FROM
    WhatsappSendsClean
WHERE
    LOWER(Status) IN ('failed', 'not sent')
    AND Reason NOT LIKE '%131049%'
GROUP BY
    ContactKey
