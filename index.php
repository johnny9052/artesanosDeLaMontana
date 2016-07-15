<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>Artesanos de la montaña</title>


        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link href="Resource/Framework/MaterializedPublic/css/materialize.css" rel="stylesheet" type="text/css" media="screen,projection"/>        
        <link href="Resource/Framework/MaterializedPublic/css/styleBlack.css" rel="stylesheet" type="text/css" media="screen,projection"/>

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
                <a id="logo-container" href="#" class="brand-logo">Logo</a>
                <ul class="right hide-on-med-and-down">

                    <li><a href="#ModalComentario" class="modal-trigger">Contactanos</a></li>

                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Productos<i class="material-icons right">arrow_drop_down</i></a></li>
                    <!-- Dropdown Structure -->
                    <ul id="dropdown1" class="dropdown-content">                                                
                        <li class="menufondo"><a href="#!">American brown ale (Dulima)</a></li>
                        <li class="divider"></li>
                        <li><a href="#!">Irish red ale (Santa Chava)</a></li>
                        <li class="divider"></li>                        
                        <li><a href="#!">Imperial stout con café (Tatamá)</a></li>
                        <li class="divider"></li>
                        <li><a href="#!">Bohemian Pilsener (Cumanday)</a></li>
                        <li class="divider"></li>                                                                                               
                    </ul>                                                                                                                             
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#ModalComentario" class="modal-trigger">Contactanos</a></li>

                    <li class="no-padding">
                        <ul class="collapsible collapsible-accordion">
                            <li>
                                <a class="collapsible-header">Productos<i class="material-icons right">arrow_drop_down</i></a>
                                <div class="collapsible-body">
                                    <ul>
                                        <li><a class="submenu" href="index.php?page=estudiantes">American brown ale (Dulima)</a></li>                                    
                                        <li><a class="submenu" href="index.php?page=estudiantes">Irish red ale (Santa Chava)</a></li>            
                                        <li><a class="submenu" href="index.php?page=estudiantes">Imperial stout con café (Tatamá)</a></li>                                      
                                        <li><a class="submenu" href="index.php?page=estudiantes">Bohemian Pilsener (Cumanday)</a></li>            
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>

        <div id="index-banner" class="parallax-container">
            <div class="section no-pad-bot">
                <div class="container">
                    <br><br>
                    <h1 class="header center text-lighten-3">Artesanos de la Montaña</h1>
                    <div class="row center">
                        <h5 class="header col s12 light">Algo más que una cerveza artesanal, es la esencia de Colombia en cada sorbo</h5>
                    </div>

                </div>
            </div>
            <div class="parallax"><img src="Resource/Images/Public/background1.jpg" alt="Unsplashed background img 1"></div>
        </div>


        <div class="container">
            <div class="section">

                <h3><i class="mdi-content-send brown-text"></i></h3>
                <div class="row center">
                    <a href="" id="download-button" class="btn-large waves-effect waves-light teal lighten-1">Conoce Nuestros productos</a>
                </div>

                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons iconoverde">grade</i></h2>
                            <h5 class="center">Excelencia unica</h5>
                            <p class="light textojustificado">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons iconoverde">group</i></h2>
                            <h5 class="center">Comparte con amigos</h5>

                            <p class="light textojustificado">By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and animations that provide more feedback to users. Additionally, a single underlying responsive system across all platforms allow for a more unified user experience.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons iconoverde">store</i></h2>
                            <h5 class="center">Sabor regional</h5>

                            <p class="light textojustificado">We have provided detailed documentation as well as specific code examples to help new users get started. We are also always open to feedback and can answer any questions a user may have about Materialize.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="parallax-container valign-wrapper">
            <div class="section no-pad-bot">
                <div class="container">
                    <div class="row center">
                        <h5 class="header col s12 light">Utilizamos materias primas locales de la mas alta calidad</h5>
                    </div>
                </div>
            </div>
            <div class="parallax"><img src="Resource/Images/Public/background2.jpg" alt="Unsplashed background img 2"></div>
        </div>

        <div class="container">
            <div class="section">

                <div class="row">
                    <div class="col s12 center">
                        <h3><i class="mdi-content-send brown-text"></i></h3>

                        <div class="row center">
                            <a  href="#ModalComentario"  id="download-button" class="btn-large waves-effect waves-light teal lighten-1 modal-trigger">Contactanos</a>                         
                        </div>


                        <p class="textojustificado light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;</p>
                    </div>
                </div>

            </div>


        </div>


        <div class="parallax-container valign-wrapper">
            <div class="section no-pad-bot">
                <div class="container">
                    <div class="row center">
                        <h5 class="header col s12 light">Proceso totalmente artesanal</h5>
                    </div>
                </div>
            </div>
            <div class="parallax"><img src="Resource/Images/Public/background3.jpg" alt="Unsplashed background img 3"></div>
        </div>

        <footer class="page-footer teal">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="">Visitanos</h5>
                        <p class="grey-text text-lighten-4">
                            Nos encontramos ubicados en Pereria<br>
                            Escribenos a artesanosdelamontana@gmail.com para tener el gusto de antenderlo
                        </p>
                    </div>
                    <div class="col l3 s12">
                        <h5 class="">Productos</h5>
                        <ul>
                            <li><a class="white-text" href="#!">American brown ale (Dulima)</a></li>
                            <li><a class="white-text" href="#!">Irish red ale (Santa Chava)</a></li>
                            <li><a class="white-text" href="#!">Imperial stout con café (Tatamá)</a></li>
                            <li><a class="white-text" href="#!">Bohemian Pilsener (Cumanday)</a></li>
                        </ul>
                    </div>


                    <div class="col l3 s12">
                        <h5 class="">Siguenos</h5>
                        <ul>
                            <li class="mdi mdi-facebook-box iconoblanco">
                                <a class="white-text" href="https://www.facebook.com/artesanosdelamontana" target="_blank"> Facebook</a>
                            </li>
                            <br>
                            <li class="mdi mdi-twitter-box iconoblanco"><a class="white-text" href="https://twitter.com/ArtesanoMontana" target="_blank"> Twitter</a></li>
                            <br>
                            <li class="mdi mdi-youtube-play iconoblanco"><a class="white-text" href="https://www.youtube.com/channel/UCwnlXvNoglSYdBIL-Zc0q0w" target="_blank"> YouTube</a></li>                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    Compañia Colombiana <a class="textoVerde text-lighten-3" href="">Artesanos de la Montaña</a>
                </div>
            </div>
        </footer>

        <!-- Modal Structure -->
        <div id="ModalComentario" class="modal modal-fixed-footer modalDark">
            <div class="modal-content">
                <h4></h4>

                <div class="row" id="FormContainer">
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">perm_identity</i>
                                <input id="input_text" type="text" length="30" placeholder="Ingresa tu nombre">                                
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">email</i>
                                <input id="input_text" type="text" length="20" placeholder="Ingresa tu correo">
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">mode_edit</i>
                                <textarea id="textarea1" class="materialize-textarea" length="500" placeholder="¿Que quieres comentarnos?"></textarea>                                
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer modalDark">
                <a class="modal-action modal-close waves-effect waves-red btn-flat ">Cancelar</a>
                <a class="modal-action modal-close waves-effect waves-green btn-flat" onclick="save();">Enviar</a>
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
