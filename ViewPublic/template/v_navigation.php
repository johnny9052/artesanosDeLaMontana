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
        <!-- Estilo por defecto -->
        <!--        <nav class="white" role="navigation">-->
        <nav role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo">

                </a>
                <ul class="right hide-on-med-and-down">

                    <li><a href="index.php">Inicio</a></li>
                    <li><a href="#ModalComentario" class="modal-trigger">Contáctanos</a></li>
                    <li><a href="index.php?page=buy">Pedidos</a></li>

                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Productos<i class="material-icons right">arrow_drop_down</i></a></li>
                    <!-- Dropdown Structure -->
                    <ul id="dropdown1" class="dropdown-content">                                                
                        <li class="menufondo"><a href="#!">American brown ale (Dulima)</a></li>
                        <li class="divider"></li>
                        <li><a href="#!">Irish Red Ale (Santa Chava)</a></li>
                        <li class="divider"></li>                        
                        <li><a href="#!">Imperial Stout Con Café (Tatamá)</a></li>
                        <li class="divider"></li>
                        <li><a href="#!">Bohemian Ale (Cumanday)</a></li>
                        <li class="divider"></li>                                                                                               
                    </ul>                                                                                                                             

                    <?php
                    if (isset($_SESSION['identificationPublic'])) {
                        echo " <li><a>Bienvenid@: " . $_SESSION["namePublic"] . " </a></li>";
                        ?>
                        <li><a onclick="LogOutPublic();">Cerrar sesion</a></li>
                        <?php
                    } else {
                        ?>
                        <li><a href="#ModalLogIn" class="modal-trigger">Identificarse</a></li>
                        <li><a href="#ModalRegister" class="modal-trigger">Registrarse</a></li>                    

                    <?php } ?>

                </ul>

                <ul id="nav-mobile" class="side-nav">

                    <li><a href="index.php">Inicio</a></li>
                    <li><a href="#ModalComentario" class="modal-trigger">Contáctanos</a></li>
                    <li><a href="index.php?page=buy">Pedidos</a></li>


                    <li class="no-padding">
                        <ul class="collapsible collapsible-accordion">
                            <li>
                                <a class="collapsible-header">Productos<i class="material-icons right">arrow_drop_down</i></a>
                                <div class="collapsible-body">
                                    <ul>
                                        <li><a class="submenu" href="index.php">American Brown Ale (Dulima)</a></li>                                    
                                        <li><a class="submenu" href="index.php">Irish Red Ale (Santa Chava)</a></li>            
                                        <li><a class="submenu" href="index.php">Imperial Stout Con Café (Tatamá)</a></li>                                      
                                        <li><a class="submenu" href="index.php">Bohemian Ale (Cumanday)</a></li>            
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </li>

                    <?php
                    if (isset($_SESSION['identificationPublic'])) {
                        echo " <li><a>Bienvenid@: " . $_SESSION["namePublic"] . " </a></li>";
                        ?>
                    <li><a onclick="LogOutPublic();">Cerrar sesion</a></li>
                        <?php
                    } else {
                        ?>
                        <li><a href="#ModalLogIn" class="modal-trigger">Identificarse</a></li>
                        <li><a href="#ModalRegister" class="modal-trigger">Registrarse</a></li>                    

                    <?php } ?>
                </ul>

                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>

    </body>
</html>
