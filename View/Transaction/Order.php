<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>

        <script defer type="text/javascript" src="Resource/Script/Transaction/Order.js"></script>
    </head>
    <body>


        <br>       


        <!-- BOTON AÑADIR Y PRIMERA BARRA DE CARGA-->
        <div class="row">
            <div class="col s4 l4 m4 left">
                <a class="l3 btn-floating btn modal-trigger" id="btnOpen" href="#ModalNew" onclick="showButton(true);loadProductType();">
                    <i class="material-icons">add</i>
                </a>
            </div>
            <div class="col s4 l4 m4 container">
                <div class="progress">
                    <div class="indeterminate"></div>
                </div>
            </div>
        </div>
        <!-- END BOTON AÑADIR Y PRIMERA BARRA DE CARGA-->


        <br>
        <br>

        <!-- LISTADO DE REGISTROS-->
        <table  class="centered bordered responsive-table highlight" id="TblList">                        
        </table>
        <!-- END LISTADO DE REGISTROS-->




        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div id="ModalNew" class="boxModal modal">
            <div class="modal-content">
                <!-- CENTRAR LOS ELEMENTOS DEL FORMULARIO -->
                <div class="boxModal container col s12" id="FormContainer">  

                    <div id="structureGlobalBuy" class="boxorange col m10 offset-m1 s12">    

                        <form class="col s12" id="structureBuy2">

                            <div class="input-field col s12">
                                <input id="txtItsOk" name="itsOk" class="identificator"  type="text" value="false">                    
                            </div>

                            <div class="input-field col s12">
                                <input id="txtId" name="id" class="identificator"  type="text" value="">                    
                            </div>

                            <div class="row">
                                <div class="input-field col s10">
                                    <input id="txtCedula" name="keyValidation"  type="number" value="" 
                                           placeholder="Cedula del cliente">                    
                                </div>

                                <div class="input-field col s2">
                                    <a class="buttonAction s2 btn-floating" id="btnValidate" 
                                       onclick="validate();"><i class="material-icons">search</i></a>                                     
                                </div>                               
                            </div>    

                            <div class="row center-row" id="noValidateSection" hidden>
                                ¿Registrar cliente?
                                <a class="buttonAction s2 btn-floating" id="btnAddValidate" 
                                   onclick="refreshPage('Client/Contact');"><i class="material-icons">add</i></a> 
                            </div>


                            <div class="row">
                                <div class="input-field col s12">
                                    <select id="selCity" name="city" required>
                                        <option value="-1" selected> -- SELECCIONE CIUDAD --</option>                            
                                    </select>
                                </div>
                            </div>           

                            <div class="row">
                                <div class="input-field col s12">                                
                                    <input id="txtDireccionPedido" type="text" name="direccion" required 
                                           value="" placeholder="Direccion de entrega">
                                    <!--<label for="txtDireccionPedido">Direccion de entrega</label>-->
                                </div>                               
                            </div>    


                            <div class="row">
                                <div class="input-field col s12">
                                    <textarea id="txtDescription" name="description" class="materialize-textarea" value="" autocomplete="off" 
                                              placeholder="Observaciones"></textarea>                                                  
                                    </label>
                                </div>
                            </div>

                            <input id="txtIdClient" type="hidden" name="idclient"
                                   value="">

                            <div id="listadoInventarioDisponible">
                            </div>

                        </form>         
                    </div>      

                </div>   
            </div>

            <div  class="buttonContainer modal-footer center-row">

                <div class="progress">
                    <div class="indeterminate"></div>
                </div>

                <br>

                <div class="row newActionButton">
                    <a class=" buttonAction l4 btn-floating" id="btnSave" 
                       onclick="save();"><i class="material-icons">save</i></a>                                

                    <a class="buttonAction l4 btn-floating" 
                       onclick="closeWindow();resetOrder();"><i class="material-icons">cancel</i></a>                                
                </div>

                <div class="row updateActionButton">

                </div>             

            </div>
        </div>
        <!-- END MODAL PARA ADMINISTRACION DE REGISTROS-->




        <!-- MODAL DE CONFIRMACION-->
        <div id="ModalConfirm" class="modal">
            <div class="modal-content">
                <h4>Confirmar</h4>
                <p>¿Seguro que desea eliminar el registro?</p>
            </div>
            <div class="modal-footer">
                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" onclick="deleteInfo();">Aceptar</a>
                <a class=" modal-action modal-close waves-effect waves-green btn-flat" onclick="goNavigation('ModalConfirm', 'ModalDetail');">Cancelar</a>
            </div>
        </div>
        <!-- END MODAL DE CONFIRMACION-->





        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div id="ModalDetail" class="boxModal modal">
            <div class="modal-content">

                <div class="row">
                    <div class="input-field col s12">
                        <input type="checkbox" id="chkEstado" name="estado"/>
                        <label for="chkEstado">¿El pedido ya fue entregado?</label>                        
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12"> 
                        <b id="observ">Observaciones </b>
                        <label for="observ" id="lblObservaciones"></label>                        
                    </div>
                </div>

                <!--CENTRAR LOS ELEMENTOS DEL FORMULARIO -->
                <div class="boxModal container col s12" id="FormContainer">  
                    <!--LISTADO DE REGISTROS-->
                    <table  class="centered bordered responsive-table highlight" id="TblListDetail">                        
                    </table>
                    <!--END LISTADO DE REGISTROS-->
                </div>   


            </div>

            <div  class="buttonContainer modal-footer center-row">

                <div class="progress">
                    <div class="indeterminate"></div>
                </div>

                <br>

                <div class="row updateActionButton">       

                    <a class="buttonAction l4 btn-floating" id="btnSave" 
                       onclick="updateState();"><i class="material-icons">edit</i></a> 

                    <a class="buttonAction l4 btn-floating" id="btnSave" 
                       onclick="goNavigation('ModalDetail', 'ModalConfirm');"><i class="material-icons">delete</i></a>    

                    <a class="buttonAction l4 btn-floating" 
                       onclick="closeWindow('ModalDetail');"><i class="material-icons">cancel</i></a>                                
                </div>             

            </div>
        </div>
        <!-- END MODAL PARA ADMINISTRACION DE REGISTROS-->

    </body>
</html>
