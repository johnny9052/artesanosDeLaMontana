/* Funciones jQuery */
$(window).load(function () {
    list();
    loadAmargor();
});


function loadAmargor() {
    Execute(scanInfo('loadAmargor', true), 'General/CtlGeneral', '', 'buildSelect(info,"selAmargor");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Parameterization/CtlBeerProduct', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Parameterization/CtlBeerProduct', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Parameterization/CtlBeerProduct', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtName").val(info[0].nombre);
    $("#txtDescription").val(info[0].descripcion);
    $("#txtAlcohol").val(info[0].alcohol);
    $("#txtPrice").val(info[0].valor);
    $("#txtCantidad").val(info[0].cantidad);
    refreshSelect("selAmargor", info[0].amargor);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Parameterization/CtlBeerProduct', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Parameterization/CtlBeerProduct', '', 'closeWindow();list();');
}
