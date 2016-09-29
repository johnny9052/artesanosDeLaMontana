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
        <h2 class="center-align" style="color: white">Pedidos</h2>
        <div class="boxorange col m10 offset-m1 s12">                    
            <form class="col s12">
                <br>
                <div class="row input-field col s12">
                    <i class="material-icons prefix">perm_identity</i>                       
                    <input id="txtName" name="name" type="text" value="" autocomplete="off" required 
                           length="50">
                    <label for="txtName">Ingresa tu nombre</label>
                </div>                            


                <div class="row input-field col s12">
                    <i class="material-icons prefix">email</i>
                    <input id="txtEmail" name="email" type="email" value="" autocomplete="off" required >
                    <label for="txtEmail">Ingresa tu correo</label>
                </div>                            


                <div class="row input-field col s12">
                    <i class="material-icons prefix">mode_edit</i>
                    <textarea id="txtDescription" class="materialize-textarea" length="2000" 
                              required name="description"></textarea>                                
                    <label for="txtDescription">¿Que quieres comentarnos?</label>
                </div> 
            </form>
        </div>     
    </body>
</html>
