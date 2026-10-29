SELECT
    _Sent.AccountID,
    _Sent.JobID,
    _Sent.SubscriberID,
    _Sent.SubscriberKey,
    _Open.IsUnique
FROM
    _Sent
    LEFT JOIN _Open ON _Sent.JobID = _Open.JobID
    AND _Sent.ListID = _Open.ListID
    AND _Sent.BatchID = _Open.BatchID
    AND _Sent.SubscriberID = _Open.SubscriberID
