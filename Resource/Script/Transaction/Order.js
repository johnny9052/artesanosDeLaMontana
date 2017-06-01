/* Funciones jQuery */
/* global app */

$(window).load(function () {
    list();
    loadCity();
});



function loadProductType() {
    Execute(scanInfo('loadBeerTypeStock', true), 'General/CtlGeneral', '', 'buildBuyProduct(info,"listadoInventarioDisponible");');
}

function loadCity() {
    Execute(scanInfo('loadCity', true), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");');
}


function validate() {
    var cedula = $("#txtCedula").val();
    if (cedula !== "") {
        Execute(scanInfo('validateClient', true), 'General/CtlValidation', '', 'detectValidate(info);');
    } else {
        showToast("Ingrese la cedula del cliente a validar");
    }
}



function save() {
    if ($("#txtItsOk").val() === "true") {
        var temp = new Array();
        temp.push("products");
        var status = false;

        $(".inventaryBuy").each(function () {
            var elemento = this;
            if (elemento.value !== undefined && elemento.value !== "") {
                temp.push(elemento.id);
                temp.push(elemento.value);
                status = true;
            }
        });

        if (status) {
            if (validateForm('structureBuy2')) {
                Execute(scanInfo('save', true, 'structureBuy2', [{datos: temp}]), 'Shop/CtlOrder', '', 'closeWindow();resetOrder();list();');
            }
        } else {
            showToast("Ingrese como minimo la cantidad de 1 producto");
        }
    } else {
        showToast("Valide el cliente");
    }
}



function buildBuyProduct(info, id) {

    $("#" + id).html("");

    var structure = "";

    if (info.length > 0) {
        for (var x in info) {
            structure += '<div class="row">\n\
                                    <div class="input-field col s4 m3">\n\
                                        <blockquote>\n\
                                            ' + info[x].nombre + '<br>\n\
                                            ' + 'Stock: ' + info[x].stock + '\n\
                                        </blockquote>\n\
                                    </div>\n\
                                    <div class="input-field col s8 m9">\n\
                                        <input id="' + info[x].id + '" type="number" \n\
                                            class=" inventaryBuy"  \n\
                                            min="1" max="' + info[x].stock + '">\n\
                                        <label for="icon_telephone">Cantidad</label>\n\
                                    </div>\n\
                        </div> ';
        }


    } else {
        structure += '<div class="row">\n\
                        <form class="col s12">\n\
                            <div class="row"> \n\
                                <div class="input-field col s4 m2">\n\
                                    <blockquote>\n\
                                        No hay productos en el inventario\n\
                                    </blockquote>\n\
                                </div>\n\
                            </div>\n\
                        </form>\n\
                    </div>';
    }

    $("#" + id).html($("#" + id).html() + structure);
}




function list() {
    Execute(scanInfo('listfilter'), 'Shop/CtlOrder', '', 'buildPaginatorFilter(info);');
}


function detail(id) {
    $("#txtId").val(id);
    Execute(scanInfo('detail', true), 'Shop/CtlOrder', '', 'showDetail(info);search();');
}


function search() {
    Execute(scanInfo('search', true), 'Shop/CtlOrder', '', 'showData(info);');
}

function showData(info) {
    $("#chkEstado").prop("checked", (info[0].estado === "1") ? true : false);
    $("#lblObservaciones").html(info[0].descripcion);
    $("#txtDescriptionAdmin").val(info[0].descripcion_administracion);
}


function updateState() {
    if (validateSearch() === true) {
        Execute(scanInfo('updatestate', true, 'ModalDetail', [{datos: ['id', $("#txtId").val()]}]), 'Shop/CtlOrder', '', 'closeWindow("ModalDetail");list();');
    }
}


function detectValidate(info) {
    if (info === "") {
        showToast("No se encontro en el sistema, por favor registrelo");
        $("#noValidateSection").show();
    } else {
        showToast("Registro validado");
        $("#txtCedula").prop('disabled', 'disabled');
        $("#noValidateSection").hide();
        $("#txtItsOk").val(true);
        $("#txtDireccionPedido").val(info[0].direccion);
        $("#txtIdClient").val(info[0].id);
    }
}



function deleteInfo() {
    if (validateSearch() === true) {
        Execute(scanInfo('delete', true), 'Shop/CtlOrder', '', 'closeWindow();list();');
    }
}



function resetOrder() {
    $("#txtCedula").removeAttr('disabled');
    $("#noValidateSection").hide();
    $("#txtItsOk").val(false);
    $("#txtDireccionPedido").val("");
    loadProductType();
}




function reportCSV() {
    ExecuteNewTab(scanInfoNewTab('reportcsv'), 'Shop/CtlOrder');
}