SELECT
    bounce.SubscriberKey,
    bdg.Email
FROM
    ipWarming_AllBounce bounce
    INNER JOIN BDD_General bdg ON bounce.SubscriberKey = bdg.Contact_Id
