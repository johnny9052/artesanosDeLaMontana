/* Funciones jQuery */
$(window).load(function () {
    list();
    loadDepartment();
});


function loadDepartment() {
    Execute(scanInfo('loadDepartment', true), 'General/CtlGeneral', '', 'buildSelect(info,"selDepartment");');
}

function save() {

    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm() === true) {
            Execute(scanInfo('save', true), 'Parameterization/CtlCity', '', 'closeWindow();list();');
        }
    } else {
        showToast("El password no coincide");
    }
}

function list() {
    Execute(scanInfo('list'), 'Parameterization/CtlCity', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Parameterization/CtlCity', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtName").val(info[0].nombre);
    refreshSelect("selDepartment", info[0].iddepartment);
    $("#txtDescription").val(info[0].descripcion);
    openWindow();
    showButton(false);
}


function update() {
    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm() === true) {
            Execute(scanInfo('update', true), 'Parameterization/CtlCity', '', 'closeWindow();list();');
        }
    } else {
        showToast("El password no coincide");
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Parameterization/CtlCity', '', 'closeWindow();list();');
}
