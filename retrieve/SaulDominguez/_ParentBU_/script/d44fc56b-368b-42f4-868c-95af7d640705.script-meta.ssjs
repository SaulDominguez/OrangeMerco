var debug = false; //true or false
Platform.Load('core', '1');

//Name of Setup DE
var setupDEName = 'Setup';
var setupDE = DataExtension.Init('Setup');

//Name of columns from DE
var allContactsListName = 'ContactListName';
var contactosContratadosName = 'ContactosContratados';
var porcentajeAdvertenciaName = 'PorcentajeAdvertencia';

//row from the setup DE
try {
    var correoEnviar = 0;
    var setUpResults = setupDE.Rows.Lookup(['id'], ['1']);

    contactosContratados = parseInt(setUpResults[0][contactosContratadosName]);
    if (debug) {
        Write('Contactos Contratados: ' + Stringify(contactosContratados));
        Write('<br>');
    }
    var porcentajeAdvertencia = parseInt(setUpResults[0][porcentajeAdvertenciaName]);
    if (debug) {
        Write('Porcentaje Advertencia: ' + Stringify(porcentajeAdvertencia));
        Write('<br><br>');
    }
    //Get the number of contacts
    var allContactsList = setUpResults[0][allContactsListName];
    var contactosActuales = TreatAsContent(
        "\%\%=DataExtensionRowCount('" + allContactsList + "')=\%\%"
    );
    if (debug) {
        Write('Contactos Actuales: ' + Stringify(contactosActuales));
        Write('<br><br>');
    }
    contactosActuales = parseInt(contactosActuales);

    //check the limit
    var limite = (contactosContratados * porcentajeAdvertencia) / 100;
    if (debug) {
        Write('Primer Limite Advertecia: ' + Stringify(limite));
        Write('<br><br>');
    }
    if (contactosActuales >= contactosContratados) {
        correoEnviar = 2;
    } else if (contactosActuales >= limite) {
        correoEnviar = 1;
    }
    if (debug) {
        Write('Correo a Enviar: ' + Stringify(correoEnviar));
        Write('<br><br>');
    }
    //update number of contacts and email to send in setup DE
    var payload = {
        ContactosActuales: contactosActuales,
        CorreoEnviar: correoEnviar
    };

    var result = setupDE.Rows.Update(payload, ['id'], ['1']);
    if (debug) {
        Write('DE EmailAvisos Update: ' + Stringify(result));
        Write('<br><br>');
    }
} catch (error) {
    Write(Stringify(error));
}
