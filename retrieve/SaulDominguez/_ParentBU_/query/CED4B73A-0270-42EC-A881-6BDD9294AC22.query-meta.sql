SELECT
    _SMSMessageTracking.Mobile,
    _SMSMessageTracking.SubscriberKey,
    _SMSMessageTracking.SubscriberID,
    _SMSMessageTracking.Sent,
    _SMSMessageTracking.Delivered,
    _SMSMessageTracking.Undelivered,
    _SMSMessageTracking.ActionDateTime,
    _SMSMessageTracking.MessageText,
    _SMSMessageTracking.IsValid,
    _SMSMessageTracking.SendID,
    _SMSMessageTracking.SendPersonID,
    _SMSMessageTracking.Name,
    _SMSMessageTracking.ShortCode,
    _SMSMessageTracking.JBActivityID
FROM
    _SMSMessageTracking
WHERE
    _SMSMessageTracking.ActionDateTime >= '2025-08-01'
    AND _SMSMessageTracking.ActionDateTime <= '2025-12-22'
    AND _SMSMessageTracking.Sent = '1'
    AND _SMSMessageTracking.Delivered = '1'
