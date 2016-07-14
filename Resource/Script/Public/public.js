function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Configuration/CtlRol', '', 'closeWindow();list();');
    }
}