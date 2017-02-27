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

        <h2 class="center-align" style="color: white">Dulima</h2>


        <!-- La division por columnas fue necesaria, debido  al zoom que se hace
        en las imagenes, para pantallas grandes se segmentara, para tablets y 
        celulares se mostrara completo-->
        <div class="row">
            <div class="col l2">

            </div>

            <div class="col l8 s12 m12">
                <div class="slider">
                    <ul class="slides">
                        <li>
                            <img src="Resource/Multimedia/Products/Dulima/dulima1.jpg"> <!-- random image -->
                            <div class="caption center-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Chocolate y cítricos</h5>
                            </div>
                        </li>   

                        <li>
                            <img src="Resource/Multimedia/Products/Dulima/dulima2.jpg"> <!-- random image -->
                            <div class="caption center-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Chocolate y cítricos</h5>
                            </div>
                        </li>   

                        <li>
                            <img src="Resource/Multimedia/Products/Dulima/dulima3.jpg"> <!-- random image -->
                            <div class="caption center-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Chocolate y cítricos</h5>
                            </div>
                        </li>   

                        <li>
                            <img src="Resource/Multimedia/Products/Dulima/dulima4.jpg"> <!-- random image -->
                            <div class="caption center-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Chocolate y cítricos</h5>
                            </div>
                        </li>   
                    </ul>
                </div>
            </div>

            <div class="col l2">

            </div>
        </div>




        <div class="container">
            <div class="section">

                <div class="row">
                    <div class="col s12 center">
                        <h3><i class="mdi-content-send brown-text"></i></h3>


                        <p class="textojustificado light">
                            Color marrón claro, con notas achocolatadas y cítricas a mandarina, de cuerpo ligero, espuma clara y sensación en paladar persistente con notas tostadas, volumen de alcohol: 4º - 6º.
                        </p>

                        <div class="row center">
                            <a  href="index.php?page=buy"  id="download-button" class="btn-large waves-effect waves-light teal lighten-1 modal-trigger">Comprar</a>                         
                        </div>

                    </div>
                </div>

            </div>
        </div>



        <?php
        include("ViewPublic/template/v_footer.php");
        ?>

    </body>
</html>
