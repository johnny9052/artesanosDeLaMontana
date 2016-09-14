/* Funciones jQuery */
$(window).load(function () {
    list();
    loadClientType();
});

function loadClientType() {
    Execute(scanInfo('loadClientType', true), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeClient");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlContact', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlContact', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlContact', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect('selTypeClient',info[0].id_tipo_cliente)    
    $("#txtName").val(info[0].nombre);
    $("#txtCode").val(info[0].code);
    $("#txtEmail").val(info[0].email);
    $("#txtAddress").val(info[0].direccion);
    $("#txtPhonenumber").val(info[0].telefono);
    $("#txtDescription").val(info[0].observaciones);    
    openWindow();
    showButton(false);
    
    
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Client/CtlContact', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Client/CtlContact', '', 'closeWindow();list();');
    }
}
