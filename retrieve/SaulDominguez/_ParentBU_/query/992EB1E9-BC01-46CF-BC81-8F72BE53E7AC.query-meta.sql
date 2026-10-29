SELECT
    bg.Contact_Id AS ContactKey,
    bg.Phone,
    (
        CASE
            WHEN bn.Contact_Id IS NOT NULL THEN 'Bounced'
            ELSE 'OptedOut'
        END
    ) AS Reason,
    'True' AS Excluded
FROM
    BDD_General bg
    LEFT JOIN WhatsappBouncesCount bn ON bn.Contact_Id = bg.Contact_Id
    LEFT JOIN Whatsapp_OptOut_Requests req ON req.ContactKey = bg.Contact_Id
WHERE
    bn.Contact_Id IS NOT NULL
    OR req.ContactKey IS NOT NULL
