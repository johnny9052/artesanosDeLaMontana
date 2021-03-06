$(document).ready(function () {
    loadProductType();
    loadCity();
});


function loadProductType() {
    //Execute(scanInfo('loadBeerType', true), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeProductType");');
    Execute(scanInfo('loadBeerTypeStock', true), 'General/CtlGeneral', '', 'buildBuyProduct(info,"listadoInventarioDisponible");');
}

function loadCity() {
    Execute(scanInfo('loadCity', true), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");');
}



function saveInventary() {

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
            Execute(scanInfo('save', true, 'structureBuy2', [{datos: temp}]), 'Shop/CtlOrder', '', 'refreshOrder(msg,"structureGlobalBuy");');
        }
    }else{
        showToast("Ingrese como minimo la cantidad de 1 producto");
    }
}



function refreshOrder(msg, id) {
    var structure = '<div class="row">\n\
                        <form class="col s12">\n\
                            <div class="row"> \n\
                                <div class="input-field col s12">\n\
                                    <blockquote>\n\
                                     ' + 'Pedido realizado satisfactoriamente' + '\n\
                                    </blockquote>\n\
                                </div>\n\
                            </div>\n\
                        </form>\n\
                    </div>';

    $("#" + id).html(structure);
}




function buildBuyProduct(info, id) {

    //alert(info+"****");

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

        structure += '<div class="row center-btn">\n\
                        <div class="col s12">\n\
                            <a class="waves-effect waves-light btn" id="btnAceptarPedido" onclick="saveInventary();">\n\
                            <i class="material-icons left">done</i>Aceptar</a>\n\
                        </div>\n\
                    </div>';



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

