SELECT
    SubscriberKey
FROM
    [Clientes_No_En_BDD_General]
WHERE
    SubscriberKey LIKE '%_@_%._%'
    OR SubscriberKey LIKE '% %'
