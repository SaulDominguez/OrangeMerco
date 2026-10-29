SELECT
    _Bounce.SubscriberKey AS SubscriberKey,
    _Bounce.BounceCategoryID AS BounceCategoryID,
    _Bounce.BounceCategory AS BounceCategory,
    _Bounce.BounceSubcategoryID AS BounceSubcategoryID
FROM
    _Bounce
WHERE
    _Bounce.BounceCategory IN ('Hard bounce', 'Block bounce')
