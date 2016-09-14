/* Funciones jQuery */
$(window).load(function () {
    list();
    loadType();
});

function loadType() {
    Execute(scanInfo('loadTypeInventary', true), 'General/CtlGeneral', '', 'buildSelect(info,"selType");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Inventory/CtlMachinery', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Inventory/CtlMachinery', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Inventory/CtlMachinery', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect("selType", info[0].id_tipo);    
    $("#txtName").val(info[0].nombre);
    $("#txtCode").val(info[0].codigo);
    $("#txtDateIn").val(info[0].fecha_adquisicion);
    $("#txtValue").val(info[0].costo);   
    openWindow();
    showButton(false);        
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Inventory/CtlMachinery', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Inventory/CtlMachinery', '', 'closeWindow();list();');
    }
}
