SELECT
    ST.SubscriberKey AS Contact_Id,
    j.JourneyName,
    'SMS' AS Canal,
    ST.ActionDateTime AS Fecha_envio,
    ST.Mobile,
    ST.Sent,
    ST.Delivered
FROM
    _journeyactivity ja
    LEFT JOIN _journey j ON ja.versionid = j.versionid
    LEFT JOIN (
        SELECT
            STX.SubscriberKey,
            STX.SMSStandardStatusCodeId,
            STX.ActionDateTime,
            STX.JBActivityID,
            STX.Sent,
            STX.Delivered,
            STX.Undelivered,
            STX.MobileMessageTrackingID,
            STX.SubscriberID,
            STX.Mobile,
            ROW_NUMBER() OVER (
                PARTITION BY
                    STX.SubscriberKey
                ORDER BY
                    STX.ActionDateTime DESC
            ) AS ROWST
        FROM
            _smsmessagetracking AS STX
    ) AS ST ON ja.ActivityID = ST.JBActivityID
WHERE
    ST.ActionDateTime IS NOT NULL
    AND ST.SubscriberKey IS NOT NULL
    AND ST.Delivered = '1'
    AND j.journeyname NOT LIKE 'test%'
    AND ST.ActionDateTime BETWEEN DATEFROMPARTS(2024, 01, 01) AND DATEFROMPARTS(2024, 01, 15)
