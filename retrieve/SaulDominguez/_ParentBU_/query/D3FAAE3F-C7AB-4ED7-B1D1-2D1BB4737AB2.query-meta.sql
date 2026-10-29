SELECT DISTINCT
    _Bounce.SubscriberKey,
    _Bounce.EventDate,
    _Bounce.Domain,
    _Bounce.BounceCategory,
    _Bounce.BounceSubcategory,
    _Bounce.SMTPBounceReason,
    _JourneyActivity.ActivityName AS ExtraField_1,
    _Journey.VersionID AS ExtraField_2,
    _Journey.JourneyID AS ExtraField_3
FROM
    _Bounce
    LEFT JOIN _Job ON _Bounce.JobID = _Job.JobID
    LEFT JOIN _JourneyActivity ON _Bounce.TriggererSendDefinitionObjectID = _JourneyActivity.JourneyActivityObjectID
    LEFT JOIN _Journey ON _JourneyActivity.VersionID = _Journey.VersionID
WHERE
    _Journey.JourneyName = 'BuenFin-151124'
