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

        <!--        <link href="Resource/Style/Security/LogIn.css" rel="stylesheet">-->

        <script defer type="text/javascript" src="Resource/Script/Client/Contact.js"></script>
    </head>
    <body>


        <br>       


        <!-- BOTON AÑADIR Y PRIMERA BARRA DE CARGA-->
        <div class="row">
            <div class="col s4 l4 m4 left">
                <a class="l3 btn-floating btn modal-trigger" id="btnOpen" href="#ModalNew" onclick="showButton(true);">
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

                    <div class="input-field col s12">
                        <input id="txtId" name="id" class="identificator"  type="text" value="">                    
                    </div>


                    <div class="input-field col s12">
                        <select id="selTypeClient" name="typeClient" required>
                            <option value="-1" selected> -- SELECCIONE EL TIPO DE CLIENTE--</option>                            
                        </select>
                    </div>

                    <div class="input-field col s12">
                        <input id="txtName" name="name" type="text" value="" autocomplete="off" required
                               placeholder="Nombre del cliente o empresa">
                        <!--                        <label class="messageInfo" for="name" data-error="Este campo es obligatorio" data-success=""></label>-->
                    </div>

                    <div class="input-field col s12">
                        <input id="txtCode" name="code" type="number" value="" autocomplete="off" required
                               placeholder="Cedula o NIT">
                        <!--                        <label class="messageInfo" for="name" data-error="Este campo es obligatorio" data-success=""></label>-->
                    </div>

                    <div class="input-field col s12">
                        <input id="txtEmail" name="email" type="email" value="" autocomplete="off" required
                               placeholder="Correo electronico">
                        <!--                        <label class="messageInfo" for="name" data-error="Este campo es obligatorio" data-success=""></label>-->
                    </div>

                    <div class="input-field col s12">
                        <input id="txtAddress" name="address" type="text" value="" autocomplete="off" required
                               placeholder="Direccion">
                        <!--                        <label class="messageInfo" for="name" data-error="Este campo es obligatorio" data-success=""></label>-->
                    </div>


                    <div class="input-field col s12">
                        <input id="txtPhonenumber" name="phonenumber" type="tel" 
                               value="" autocomplete="off" required
                               placeholder="Numero telefonico">
                        <!--                        <label class="messageInfo" for="name" data-error="Este campo es obligatorio" data-success=""></label>-->
                    </div>


                    <div class="input-field col s12">
                        <textarea id="txtDescription" name="description" class="materialize-textarea" value="" autocomplete="off" 
                                  placeholder="Observaciones"></textarea>
                        <!--<label class="messageInfo" for="description" data-error="" data-success="">-->                                
                        </label>
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
                       onclick="closeWindow();"><i class="material-icons">cancel</i></a>                                
                </div>

                <div class="row updateActionButton">
                    <a class="buttonAction l4 btn-floating" id="btnSave" 
                       onclick="update();"><i class="material-icons">edit</i></a>                                

                    <a class="buttonAction l4 btn-floating" id="btnSave" 
                       onclick="goNavigation('ModalNew', 'ModalConfirm');"><i class="material-icons">delete</i></a>    

                    <a class="buttonAction l4 btn-floating" 
                       onclick="closeWindow();"><i class="material-icons">cancel</i></a>                                
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
                <a class=" modal-action modal-close waves-effect waves-green btn-flat" onclick="goNavigation('ModalConfirm', 'ModalNew');">Cancelar</a>
            </div>
        </div>
        <!-- END MODAL DE CONFIRMACION-->




    </body>
</html>
