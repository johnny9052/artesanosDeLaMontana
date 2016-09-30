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
        <div id="ModalLogIn" class="modal modalDark">
            <div class="modal-content">
                <h4></h4>
                <div class="row col s12" id="FormContainer">

                    <div class="input-field col s12">
                        <i class="material-icons prefix">subtitles</i>
                        <input id="txtCodeLogIn" name="user" type="number" value="" autocomplete="off" required
                               placeholder="Cedula o NIT">
<!--                        <label for="txtCode">Cedula o NIT</label>-->
                    </div>

                    <div class="input-field col s12">
                        <i class="material-icons prefix">verified_user</i>
                        <input id="txtPasswordLogIn" name="password" type="password" 
                               value="" autocomplete="off" required
                               placeholder="Password">
<!--                        <label for="txtPassword">Password</label>-->
                    </div>

                </div>
            </div>
            <div class="modal-footer modalDark">
                
                <a class="modal-action modal-close waves-effect waves-red btn-flat" onclick="cleanForm('ModalLogIn');">Cancelar</a>
                <a class="modal-action waves-effect waves-green btn-flat" onclick="LogInPublic('ModalLogIn');">Ingresar</a>
                
            </div>
        </div>

    </body>
</html>
