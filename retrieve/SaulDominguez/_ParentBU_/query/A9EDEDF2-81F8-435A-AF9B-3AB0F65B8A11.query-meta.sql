SELECT
    fg.*
FROM
    Fiestononon_2025_General fg
    INNER JOIN [QueryStudioResults at 2025-10-21T0101350000] qr ON fg.Contact_Id = qr.SubscriberKey
