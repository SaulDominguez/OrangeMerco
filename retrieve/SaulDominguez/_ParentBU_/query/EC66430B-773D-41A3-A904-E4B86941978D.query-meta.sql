SELECT DISTINCT
    bounce.SubscriberKey
FROM
    _Bounce bounce
WHERE
    BounceCategoryID IN ('1', '3')
