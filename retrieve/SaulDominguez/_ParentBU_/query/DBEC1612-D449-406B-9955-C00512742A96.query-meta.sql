SELECT
    mst.Contact_id AS SubscriberKey,
    uns.DateUndeliverable,
    uns.DateJoined,
    uns.DateUnsubscribed,
    uns.EmailAddress,
    uns.BounceCount,
    uns.SubscriberType,
    uns.Status
FROM
    BDD_General mst
    INNER JOIN ipWarming_Unsubscribe uns ON mst.Email = uns.SubscriberKey
