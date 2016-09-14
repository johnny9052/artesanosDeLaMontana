/* Funciones jQuery */
$(window).load(function () {
    list();
    loadType();
});

function loadType() {
    Execute(scanInfo('loadTypeExpense', true), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeExpense");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Transaction/CtlExpense', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Transaction/CtlExpense', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Transaction/CtlExpense', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect("selTypeExpense", info[0].id_tipo_gasto);
    $("#txtDescription").val(info[0].observaciones);
    $("#txtValue").val(info[0].valor);
    $("#txtDateExpense").val(info[0].fecha);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Transaction/CtlExpense', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Transaction/CtlExpense', '', 'closeWindow();list();');
    }
}
