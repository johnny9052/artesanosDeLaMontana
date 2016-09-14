/* Funciones jQuery */
$(window).load(function () {
    list();
});

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Parameterization/CtlBitter', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Parameterization/CtlBitter', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Parameterization/CtlBitter', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtName").val(info[0].nombre);
    $("#txtDescription").val(info[0].descripcion);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Parameterization/CtlBitter', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Parameterization/CtlBitter', '', 'closeWindow();list();');
    }
}
