Platform.Load('Core', '1');
try {
    var prox = new Script.Util.WSProxy();
    var targetDE = '2f72af47-f3b8-432e-9071-65f8a96285a2'; // external key  DE
    var logDE = DataExtension.Init(targetDE);

    function getImports(objectType, cols) {
        var objectType = 'ImportDefinition',
            cols = ['DestinationObject.ObjectID', 'Name', 'ObjectID'],
            moreData = true,
            reqID = null,
            numItems = 0;
        while (moreData) {
            moreData = false;
            var data =
                reqID == null
                    ? prox.retrieve(objectType, cols)
                    : prox.getNextBatch(objectType, reqID);
            if (data != null) {
                moreData = data.HasMoreRows;
                reqID = data.RequestID;
                if (data && data.Results) {
                    for (var i = 0; i < data.Results.length; i++) {
                        if (data.Results[i].DestinationObject.ObjectID) {
                            var cols = ['Name', 'CustomerKey', 'ObjectID'];
                            var filter = {
                                Property: 'ObjectID',
                                SimpleOperator: 'equals',
                                Value: data.Results[i].DestinationObject.ObjectID
                            };
                            var deName = prox.retrieve('DataExtension', cols, filter);

                            if (deName.Results[0].Name) {
                                //Write("<br />DEName:" + deName.Results[0].Name+ "//DEKEY:" + deName.Results[0].CustomerKey+ "//ActivityName:" + data.Results[i].Name+ "<br>");
                                var payload = {
                                    DEName: deName.Results[0].Name,
                                    DEKey: deName.Results[0].CustomerKey,
                                    ActivityName: data.Results[i].Name,
                                    ActivityType: 'Import',
                                    FolderLocation: 'NoneYet'
                                };

                                var result = logDE.Rows.Add(payload);
                            }
                        }
                        numItems++;
                    }
                }
            }
        }
        Write('<br />' + numItems + ' total ' + objectType + '<br>');
    }

    function getQueries(objectType, cols) {
        var objectType = 'QueryDefinition',
            cols = [
                'Name',
                'ObjectID',
                'DataExtensionTarget.Name',
                'DataExtensionTarget.CustomerKey'
            ],
            moreData = true,
            reqID = null,
            numItems = 0;
        while (moreData) {
            moreData = false;
            var data =
                reqID == null
                    ? prox.retrieve(objectType, cols)
                    : prox.getNextBatch(objectType, reqID);
            if (data != null) {
                moreData = data.HasMoreRows;
                reqID = data.RequestID;
                if (data && data.Results) {
                    for (var i = 0; i < data.Results.length; i++) {
                        //Write("<br />DEName:" + deName.Results[0].Name+ "//DEKEY:" + deName.Results[0].CustomerKey+ "//ActivityName:" + data.Results[i].Name+ "<br>");
                        var payload = {
                            DEName: data.Results[i].DataExtensionTarget.Name,
                            DEKey: data.Results[i].DataExtensionTarget.CustomerKey,
                            ActivityName: data.Results[i].Name,
                            ActivityType: 'Query',
                            FolderLocation: 'NoneYet'
                        };

                        var result = logDE.Rows.Add(payload);
                        numItems++;
                    }
                }
            }
        }
        Write('<br />' + numItems + ' total ' + objectType + '<br>');
    }
    getImports(objectType, cols);
    getQueries(objectType, cols);
} catch (e) {
    Write(Stringify(e));
}
