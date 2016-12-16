/* Funciones jQuery */
$(window).load(function () {
    list();
});

//function save() {
//    if (validateForm() === true) {
//        Execute(scanInfo('save', true), 'Message/CtlWebPage', '', 'closeWindow();list();');
//    }
//}

function list() {
    Execute(scanInfo('list'), 'Message/CtlWebPage', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Message/CtlWebPage', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtName").val(info[0].nombre);
    $("#txtEmail").val(info[0].email);
    $("#txtDescription").val(info[0].descripcion);
    $("#txtRespuesta").val(info[0].respuesta);        
    $("#chkEstado").prop("checked",(info[0].estado === "1") ? true : false);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Message/CtlWebPage', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Message/CtlWebPage', '', 'closeWindow();list();');
    }
}
