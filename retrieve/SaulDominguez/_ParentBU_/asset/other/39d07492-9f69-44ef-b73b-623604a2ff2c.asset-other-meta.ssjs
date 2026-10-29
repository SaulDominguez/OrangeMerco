Platform.Load('Core', '1');

var api = new Script.Util.WSProxy(); // Tarea 1 definirlo

function formatJson(json) {
    var formattedJson = TreatAsContent(
        "\%\%=replace('" + Stringify(json) + "', ',', ',<br>')=\%\%"
    );
    formattedJson = TreatAsContent("\%\%=replace('" + formattedJson + "', '{', '{<br>')=\%\%");
    formattedJson = TreatAsContent("\%\%=replace('" + formattedJson + "', '}', '<br>}')=\%\%");
    formattedJson = TreatAsContent("\%\%=replace('" + formattedJson + "', '[', '<br>[<br>')=\%\%");
    formattedJson = TreatAsContent("\%\%=replace('" + formattedJson + "', ']', '<br>]')=\%\%");
    return formattedJson;
}

function debugValue(description, value) {
    Write(description + ': ' + (typeof value == 'object' ? Stringify(value) : value) + '<br><br>');
}

try {
    var automations = retrieveAllAutomations();

    Write(Stringify(automations));
} catch (err) {
    Write(Stringify(err));
}

function createDE() {
    var extKey = GUID();
    var config = {
        CustomerKey: extKey,
        Name: 'DataExtensionAutomationInventory',
        IsTestable: false,
        Fields: [
            {
                Name: 'AutomationName',
                FieldType: 'Text',
                MaxLength: 500
            },
            {
                Name: 'AutomationKey',
                FieldType: 'Text',
                MaxLength: 500
            },
            {
                Name: 'FolderLocation',
                FieldType: 'Text',
                MaxLength: 500
            }
        ]
    };

    var result = DataExtension.Add(config);
    return extKey;
}

function retrieveAllAutomations() {
    var extKey = createDE();
    var targetDE = DataExtension.Init(extKey);

    var out = [],
        moreData = true,
        reqID = (data = null);

    var cols = [
        'Name',
        'Description',
        'CustomerKey',
        'IsActive',
        'CreatedDate',
        'ModifiedDate',
        'Status',
        'ProgramID',
        'CategoryID',
        'LastRunTime',
        'ScheduledTime',
        'LastSaveDate',
        'ModifiedBy',
        'LastSavedBy',
        'CreatedBy',
        'AutomationType',
        'RecurrenceID'
    ];

    var filter = {
        Property: 'Status',
        SimpleOperator: 'IN',
        Value: [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8]
    };

    var opts = {
        BatchSize: 300
    };

    var props = {
        QueryAllAccounts: false
    };

    var stubbedRecords = [];

    while (moreData) {
        moreData = false;

        if (reqID) props.ContinueRequest = reqID;

        var data = api.retrieve('Automation', cols, filter, opts, props);

        if (data) {
            moreData = data.HasMoreRows;
            reqID = data.RequestID;
            for (var i = 0; i < data.Results.length; i++) {
                // out.push(data.Results[i]);
                var dataint1 = data.Results[i];
                var folder = retrieveFolderPath(dataint1.CategoryID);

                // Write(Stringify(request1.Results[0]));
                // Write("<br /> name: " + dataint1.Name + "// folder: " + folder + "<br>");

                stubbedRecords.push({
                    AutomationName: dataint1.Name,
                    AutomationKey: dataint1.CustomerKey,
                    FolderLocation: folder
                });
            }
        }
    }

    //  return out;
    debugValue(formatJson(stubbedRecords));

    targetDE.Rows.Add(stubbedRecords);
}

function retrieveFolderPath(catid) {
    var list = [];
    var id = catid;

    while (id > 0) {
        var req = api.retrieve('DataFolder', ['Name', 'ParentFolder.ID'], {
            Property: 'ID',
            SimpleOperator: 'equals',
            Value: id
        });

        list.unshift(req.Results[0].Name);
        id = req.Results[0].ParentFolder.ID;
    }

    return list.join(' / ');
}
