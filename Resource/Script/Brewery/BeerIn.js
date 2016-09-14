/* Funciones jQuery */
$(window).load(function () {
    list();
    loadBeerType();
});

function loadBeerType() {
    Execute(scanInfo('loadBeerType', true), 'General/CtlGeneral', '', 'buildSelect(info,"selBeerType");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Brewery/CtlBeerIn', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Brewery/CtlBeerIn', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Brewery/CtlBeerIn', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect('selBeerType', info[0].id_tipo_cerveva);
    $("#txtBootle").val(info[0].cantidad);
    $("#txtPresentation").val(info[0].presentacion);
    $("#txtLote").val(info[0].lote);
    $("#txtDateMosto").val(info[0].fecha_fabricacion);
    $("#txtDateGasificacion").val(info[0].fecha_gasificacion);
    $("#txtDescription").val(info[0].observaciones);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Brewery/CtlBeerIn', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Brewery/CtlBeerIn', '', 'closeWindow();list();');
    }
}
