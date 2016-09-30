$(document).ready(function () {
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
    loadClientType();
});


function loadClientType() {
    Execute(scanInfo('loadClientType', true), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeClientRegister");');
}


function save(form) {
    if (validateForm(form) === true) {
        Execute(scanInfo('save', true, form), 'Public/CtlMessage', '', 'closeWindow();');
    }
}


function register(form) {
    if (validateForm(form) === true) {
        Execute(scanInfo('register', true), 'Client/CtlContact', '', 'closeWindow("ModalRegister");');
    }
}


/* Identificar a un usuario del sistema */
function LogInPublic(form) {
    if (validateForm(form) === true) {
        Execute(scanInfo('logInPublic', true), 'Security/CtlLogIn', '', 'location.reload();');
    }
}
