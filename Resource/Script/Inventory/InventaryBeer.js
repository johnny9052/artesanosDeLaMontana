/* Funciones jQuery */
$(window).load(function () {
    list();
});

function list() {
    Execute(scanInfo('list'), 'Inventory/CtlInventaryBeer', '', 'buildPaginator(info);');
}
