Platform.Load('core', '1');

try {
    var config = {
        CustomerKey: GUID(),
        Name: 'DataExtensionInventory',
        IsTestable: false,
        Fields: [
            {
                Name: 'DEName',
                FieldType: 'Text',
                MaxLength: 500
            },
            {
                Name: 'DEKey',
                FieldType: 'Text',
                MaxLength: 500
            },
            {
                Name: 'ActivityName',
                FieldType: 'Text',
                MaxLength: 500
            },
            {
                Name: 'ActivityType',
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

    Write(Stringify(result));
} catch (error) {
    Write(Stringify(error));
}
