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
        <script src="Resource/Script/Public/buy.js" type="text/javascript"></script>
    </head>
    <body>
        <h2 class="center-align" style="color: white">Pedidos</h2>
        <div id="structureGlobalBuy" class="boxorange col m10 offset-m1 s12">    

            <form class="col s12" id="structureBuy2">

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
                               value="<?php
                               (isset($_SESSION['addressPublic'])) ? print $_SESSION['addressPublic'] : print "";
                               ?>" >
                        <label for="txtDireccionPedido">Direccion de entrega</label>
                    </div>                               
                </div>                        

                <input type="hidden" name="idclient"
                       value="<?php
                       (isset($_SESSION['identificationPublic'])) ? print $_SESSION['identificationPublic'] : print "no existe";
                       ?>" >

                <div id="listadoInventarioDisponible">
                </div>

            </form>         
        </div>     
    </body>
</html>
