SELECT
    new.JourneyName,
    new.Canal,
    SUM(new.Sent) AS SentTotales,
    SUM(new.Delivered) AS DeliveredTotales
FROM
    SMS_All new
GROUP BY
    new.JourneyName,
    new.Canal
