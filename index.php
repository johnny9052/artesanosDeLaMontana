<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>Artesanos de la montaña</title>

        <link rel="shortcut icon" type="image/png" href="Resource/Images/Public/favicon.png"/>


        <!--        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->

        <link href="Resource/Framework/MaterializedPublic/css/materialize.css" rel="stylesheet" type="text/css" media="screen,projection"/>        
        <link href="Resource/Framework/MaterializedPublic/css/styleBlack.css" rel="stylesheet" type="text/css" media="screen,projection"/>

        <link href="Resource/Framework/MaterializedPublic/css/icons.css" rel="stylesheet" type="text/css"/>

        <link href="Resource/Style/Public/modal.css" rel="stylesheet" type="text/css"/>        

        <script src="Resource/Framework/Jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

        <script src="Resource/Framework/MaterializedPublic/js/materialize.js" type="text/javascript"></script>

        <script src="Resource/Framework/MaterializedPublic/js/init.js" type="text/javascript"></script>

        <link href="Resource/Framework/MaterializedPublic/MaterialDesign-Webfont-master/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>

        <script src="Resource/Script/General/General.js" type="text/javascript"></script>
        <script src="Resource/Script/Public/public.js" type="text/javascript"></script>
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
                                        <li><a class="submenu" href="index.php?page=estudiantes">American Brown Ale (Dulima)</a></li>                                    
                                        <li><a class="submenu" href="index.php?page=estudiantes">Irish Red Ale (Santa Chava)</a></li>            
                                        <li><a class="submenu" href="index.php?page=estudiantes">Imperial Stout Con Café (Tatamá)</a></li>                                      
                                        <li><a class="submenu" href="index.php?page=estudiantes">Bohemian Ale (Cumanday)</a></li>            
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>


        <!-- MASTER PAGE CONTROL  -->
        <?php
        if (isset($_GET['page'])) {
            include("ViewPublic/" . $_GET['page'] . ".php");
        } else {
            include("ViewPublic/home.php");
        }
        ?>
        <!--END MASTER PAGE CONTROL  -->

        <div class="fixed-action-btn" style="bottom: 25px; right: 24px;border-style: none !important;">
            <a class="btn-floating btn-large white" style="width: 90px;height: 90px;border-style: none !important;">
                <img src="Resource/Images/Public/LogoCircular.png" alt="" style="width: 90px;height: 90px;border-style: none !important;"/>                
            </a>           
        </div>


        <!-- Modal Structure -->
        <div id="ModalComentario" class="modal modal-fixed-footer modalDark">
            <div class="modal-content">
                <h4></h4>

                <div class="row col s12" id="FormContainer">

                    <div class="row input-field col s12">
                        <i class="material-icons prefix">perm_identity</i>                       
                        <input id="txtName" name="name" type="text" value="" autocomplete="off" required 
                               length="50">
                        <label for="txtName">Ingresa tu nombre</label>
                    </div>                            


                    <div class="row input-field col s12">
                        <i class="material-icons prefix">email</i>
                        <input id="txtEmail" name="email" type="email" value="" autocomplete="off" required 
                               >
                        <label for="txtEmail">Ingresa tu correo</label>
                    </div>                            


                    <div class="row input-field col s12">
                        <i class="material-icons prefix">mode_edit</i>
                        <textarea id="txtDescription" class="materialize-textarea" length="2000" 
                                  required name="description"></textarea>      
                        <label for="txtDescription">¿Que quieres comentarnos?</label>
                    </div>

                </div>
            </div>
            <div class="modal-footer modalDark">
                <a class="modal-action modal-close waves-effect waves-red btn-flat" onclick="cleanForm('ModalComentario');">Cancelar</a>
                <a class="modal-action waves-effect waves-green btn-flat" onclick="save();">Enviar</a>
            </div>
        </div>



        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });
        </script>

    </body>


</html>
