function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Public/CtlMessage', '', 'closeWindow("ModalComentario");');
    }
}