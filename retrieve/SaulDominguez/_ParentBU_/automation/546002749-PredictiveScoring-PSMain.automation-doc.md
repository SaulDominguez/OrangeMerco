## 546002749-PredictiveScoring-PSMain

**Name** (not equal to External Key)**:** 546002749-PSMain

**Description:** This automation sends CURRENT data to the Data Scientists for scoring and is an important componentof the Einstein Engagement Scoring application.

**Folder:** my automations/Data Factory Utility Automations/

**Started by:** Schedule

**Status:** Scheduled

**Schedule:**

* Start: 2023-08-14 22:52:16.35 -06:00
* End: 2053-08-12 22:52:16 -06:00
* Timezone: Central Standard Time (no DST)
* Recurrence: every 24 hours for 10957 times

**Notifications:** _none_


| Step 1<br>_<small>Predictive Scoring extract-upload task #01</small>_ | Step 2<br>_<small>Predictive Scoring extract-upload task #02</small>_ | Step 3<br>_<small>Predictive Scoring extract-upload task #03</small>_ | Step 4<br>_<small>Predictive Scoring extract-upload task #04</small>_ | Step 5<br>_<small>Predictive Scoring extract-upload task #05</small>_ | Step 6<br>_<small>Predictive Scoring extract-upload task #06</small>_ | Step 7<br>_<small>Predictive Scoring extract-upload task #07</small>_ | Step 8<br>_<small>Predictive Scoring extract-upload task #08</small>_ | Step 9<br>_<small>Predictive Scoring extract-upload task #09</small>_ |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| _1.1: dataFactoryUtility_<br>Extract-Upload stats.Bounce into S3 | _2.1: dataFactoryUtility_<br>Extract-Upload Stats.RefererEmailClient into S3 | _3.1: dataFactoryUtility_<br>Extract-Upload C546002749._MobileAddress into S3 | _4.1: dataFactoryUtility_<br>Extract-Upload C546002749.PSConfig into S3 | _5.1: dataFactoryUtility_<br>Extract-Upload C546002749._MobileMessage into S3 | _6.1: dataFactoryUtility_<br>Extract-Upload C546002749.SmsMemberSharedShortCode_Config into S3 | _7.1: dataFactoryUtility_<br>Extract-Upload dbo.EmailSendDefinition into S3 | _8.1: dataFactoryUtility_<br>Extract-Upload dbo.EnterpriseMember into S3 | _9.1: dataFactoryUtility_<br>Extract-Upload C546002749.VPS_ExportDone into S3 |
| _1.2: dataFactoryUtility_<br>Extract-Upload stats.BounceDecrementQueue into S3 | _2.2: dataFactoryUtility_<br>Extract-Upload stats.Send into S3 | _3.2: dataFactoryUtility_<br>Extract-Upload C546002749._MobileMessageTracking into S3 | _4.2: dataFactoryUtility_<br>Extract-Upload dbo.ProgramActivityInstance into S3 | _5.2: dataFactoryUtility_<br>Extract-Upload dbo.ABTestSend into S3 | _6.2: dataFactoryUtility_<br>Extract-Upload C546002749.SmsMemberShortCodeDistinct into S3 | _7.2: dataFactoryUtility_<br>Extract-Upload dbo.Send into S3 | _8.2: dataFactoryUtility_<br>Extract-Upload dbo.MemberTimeZone into S3 | - |
| _1.3: dataFactoryUtility_<br>Extract-Upload stats.Click into S3 | _2.3: dataFactoryUtility_<br>Extract-Upload Stats.UserAgentApplication into S3 | _3.3: dataFactoryUtility_<br>Extract-Upload dbo.Asset into S3 | _4.3: dataFactoryUtility_<br>Extract-Upload dbo.ProgramInstance into S3 | _5.3: dataFactoryUtility_<br>Extract-Upload dbo.ABTestSendJob into S3 | _6.3: dataFactoryUtility_<br>Extract-Upload dbo.ABTestSendContent into S3 | _7.3: dataFactoryUtility_<br>Extract-Upload dbo.tblEmails into S3 | _8.3: dataFactoryUtility_<br>Extract-Upload dbo.SendDefType into S3 | - |
| _1.4: dataFactoryUtility_<br>Extract-Upload stats.Complaint into S3 | _2.4: dataFactoryUtility_<br>Extract-Upload Stats.UserAgentDevice into S3 | _3.4: dataFactoryUtility_<br>Extract-Upload dbo.PushApplicationConfig into S3 | _4.4: dataFactoryUtility_<br>Extract-Upload InteractionStudio.Activity into S3 | _5.4: dataFactoryUtility_<br>Extract-Upload dbo.CampaignAsset into S3 | _6.4: dataFactoryUtility_<br>Extract-Upload dbo.ABTestSendType into S3 | _7.4: dataFactoryUtility_<br>Extract-Upload dbo.tblLists into S3 | _8.4: dataFactoryUtility_<br>Extract-Upload dbo.tblMembers into S3 | - |
| _1.5: dataFactoryUtility_<br>Extract-Upload stats.Conversion into S3 | _2.5: dataFactoryUtility_<br>Extract-Upload Stats.UserAgentEmailClient into S3 | - | _4.5: dataFactoryUtility_<br>Extract-Upload InteractionStudio.DefinitionInfo into S3 | _5.5: dataFactoryUtility_<br>Extract-Upload dbo.CampaignAssetType into S3 | _6.5: dataFactoryUtility_<br>Extract-Upload dbo.CampaignDefinition into S3 | - | _8.5: dataFactoryUtility_<br>Extract-Upload dbo.TimeZoneDetail into S3 | - |
| _1.6: dataFactoryUtility_<br>Extract-Upload stats.Open into S3 | _2.6: dataFactoryUtility_<br>Extract-Upload Stats.UserAgentOperatingSystem into S3 | - | _4.6: dataFactoryUtility_<br>Extract-Upload InteractionStudio.EventDefinition into S3 | _5.6: dataFactoryUtility_<br>Extract-Upload dbo.CustomObject into S3 | _6.6: dataFactoryUtility_<br>Extract-Upload dbo.ImpressionRegion into S3 | - | - | - |
| _1.7: dataFactoryUtility_<br>Extract-Upload stats.Unsubscribe into S3 | - | - | _4.7: dataFactoryUtility_<br>Extract-Upload InteractionStudio.EventInstance into S3 | _5.7: dataFactoryUtility_<br>Extract-Upload dbo.JobCampaignDefinition into S3 | _6.7: dataFactoryUtility_<br>Extract-Upload dbo.JobImpressionRegion into S3 | - | - | - |
| - | - | - | - | _5.8: dataFactoryUtility_<br>Extract-Upload dbo.Program into S3 | _6.8: dataFactoryUtility_<br>Extract-Upload dbo.Members_ into S3 | - | - | - |
| - | - | - | - | _5.9: dataFactoryUtility_<br>Extract-Upload dbo.SendGroup into S3 | _6.9: dataFactoryUtility_<br>Extract-Upload dbo.SendSplit into S3 | - | - | - |
| - | - | - | - | _5.10: dataFactoryUtility_<br>Extract-Upload dbo.SendJob into S3 | _6.10: dataFactoryUtility_<br>Extract-Upload dbo.Subscriber into S3 | - | - | - |
| - | - | - | - | _5.11: dataFactoryUtility_<br>Extract-Upload dbo.SimpleTag into S3 | _6.11: dataFactoryUtility_<br>Extract-Upload dbo.tblJobs into S3 | - | - | - |
| - | - | - | - | _5.12: dataFactoryUtility_<br>Extract-Upload dbo.SimpleTagObject into S3 | _6.12: dataFactoryUtility_<br>Extract-Upload dbo.tblJobs_Lists into S3 | - | - | - |
| - | - | - | - | _5.13: dataFactoryUtility_<br>Extract-Upload dbo.SimpleTagObjectType into S3 | _6.13: dataFactoryUtility_<br>Extract-Upload dbo.tblJobs_URLs into S3 | - | - | - |
| - | - | - | - | _5.14: dataFactoryUtility_<br>Extract-Upload dbo.SourceAddress into S3 | _6.14: dataFactoryUtility_<br>Extract-Upload dbo.tblSurveyQuestions into S3 | - | - | - |
| - | - | - | - | _5.15: dataFactoryUtility_<br>Extract-Upload dbo.tblJobs_Surveys into S3 | - | - | - | - |
| - | - | - | - | _5.16: dataFactoryUtility_<br>Extract-Upload dbo.tblJobSubscriberBatch into S3 | - | - | - | - |
| - | - | - | - | _5.17: dataFactoryUtility_<br>Extract-Upload dbo.tblSurveyAnswers into S3 | - | - | - | - |
| - | - | - | - | _5.18: dataFactoryUtility_<br>Extract-Upload dbo.TriggeredSendJob into S3 | - | - | - | - |
| - | - | - | - | _5.19: dataFactoryUtility_<br>Extract-Upload InteractionStudio.Definition into S3 | - | - | - | - |
