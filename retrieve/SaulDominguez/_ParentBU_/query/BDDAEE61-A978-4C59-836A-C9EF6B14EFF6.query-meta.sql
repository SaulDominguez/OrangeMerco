SELECT
    sub.EmailAddress,
    sub.SubscriberKey
FROM
    _Subscribers AS sub
WHERE
    Status IN ('unsubscribed', 'held', 'bounced')
