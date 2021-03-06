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
        <div id="ModalComentario" class="modal modal-fixed-footer modalDark">
            <div class="modal-content">
                <h4></h4>

                <div class="row col s12" id="FormContainer">

                    <div class="row input-field col s12">
                        <i class="material-icons prefix">perm_identity</i>                       
                        <input id="txtName" name="name" type="text" 
                               value="<?php
                               (isset($_SESSION['namePublic'])) ? print $_SESSION['namePublic'] : print "";
                               ?>" 
                               autocomplete="off" required 
                               length="50" placeholder="Ingresa tu nombre">
                        <!--                        <label for="txtName">Ingresa tu nombre</label>-->
                    </div>                            


                    <div class="row input-field col s12">
                        <i class="material-icons prefix">email</i>
                        <input id="txtEmail" name="email" type="email" 
                               value="<?php
                               (isset($_SESSION['emailPublic'])) ? print $_SESSION['emailPublic'] : print "";
                               ?>" 
                               autocomplete="off" required 
                               placeholder="Ingresa tu correo">
                        <!--                        <label for="txtEmail">Ingresa tu correo</label>-->
                    </div>                            


                    <div class="row input-field col s12">
                        <i class="material-icons prefix">mode_edit</i>
                        <textarea id="txtDescription" class="materialize-textarea" length="2000" 
                                  required name="description" placeholder="¿Que quieres comentarnos?"></textarea>      
                        <!--                        <label for="txtDescription">¿Que quieres comentarnos?</label>-->
                    </div>

                </div>
            </div>
            <div class="modal-footer modalDark">
                <a class="modal-action modal-close waves-effect waves-red btn-flat" onclick="cleanForm('ModalComentario');">Cancelar</a>
                <a class="modal-action waves-effect waves-green btn-flat" onclick="save('ModalComentario');">Enviar</a>
            </div>
        </div>

    </body>
</html>
