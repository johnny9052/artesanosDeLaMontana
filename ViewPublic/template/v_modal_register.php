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
    </head>
    <body>
        <!-- Modal Structure -->
        <div id="ModalRegister" class="modal modal-fixed-footer modalDark">
            <div class="modal-content">
                <h4></h4>

                <div class="row col s12" id="FormContainer">


                    <div class="input-field col s12">
                        <i class="material-icons prefix">picture_in_picture</i>
                        <select id="selTypeClientRegister" name="typeClient" required>
                            <option value="-1" selected> -- SELECCIONE EL TIPO DE CLIENTE--</option>                            
                        </select>
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">subtitles</i>
                        <input id="txtCodeRegister" name="code" type="number" value="" autocomplete="off" required 
                               placeholder="Cedula o NIT">
                        <!--                        <label for="txtCode">Cedula o NIT</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">perm_identity</i>
                        <input id="txtNameRegister" name="name" type="text" value="" autocomplete="off" required 
                               placeholder="Nombre del cliente o empresa">
                        <!--<label for="txtName">Nombre del cliente o empresa</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">verified_user</i>
                        <input id="txtPasswordRegister" name="passwordRegister" type="password" 
                               value="" autocomplete="off" required placeholder="Password">
                        <!--<label for="txtPassword">Password</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">verified_user</i>
                        <input id="txtPasswordRegisterConfirm" name="passwordConfirm" type="password" 
                               value="" autocomplete="off" required placeholder="Confirme password">
                        <!--                        <label for="txtPassword">Confirme password</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">email</i>
                        <input id="txtEmailRegister" name="email" type="email" value="" autocomplete="off" required 
                               placeholder="Correo electronico">
                        <!--                        <label for="txtEmail">Correo electronico</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">room</i>
                        <input id="txtAddressRegister" name="address" type="text" value="" autocomplete="off" required 
                               placeholder="Direccion">
                        <!--                        <label for="txtAddress">Direccion</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">perm_phone_msg</i>
                        <input id="txtPhonenumberRegister" name="phonenumber" type="tel" 
                               value="" autocomplete="off" required placeholder="Numero telefonico">
                        <!--                        <label for="txtPhonenumber">Numero telefonico</label>-->
                    </div>

                </div>
            </div>
            <div class="modal-footer modalDark">
                <a class="modal-action modal-close waves-effect waves-red btn-flat" onclick="cleanForm('ModalRegister');">Cancelar</a>
                <a class="modal-action waves-effect waves-green btn-flat" onclick="register('ModalRegister');">Registrar</a>
            </div>
        </div>

    </body>
</html>
