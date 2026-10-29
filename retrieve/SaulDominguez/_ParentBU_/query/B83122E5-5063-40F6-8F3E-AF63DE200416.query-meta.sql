SELECT
    SubscriberID,
    DateUndeliverable,
    DateJoined,
    DateUnsubscribed,
    EmailAddress,
    BounceCount,
    SubscriberKey,
    SubscriberType,
    Status
FROM
    _Subscribers
WHERE
    Status IN ('unsubscribed', 'held', 'bounce')
