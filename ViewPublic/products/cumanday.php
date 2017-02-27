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

        <h2 class="center-align" style="color: white">Cumanday</h2>


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
                            <img src="Resource/Multimedia/Products/Cumanday/cumanday1.jpg"> <!-- random image -->
                            <div class="caption center-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Notas florales y afrutadas</h5>
                            </div>
                        </li>
                        <li>
                            <img src="Resource/Multimedia/Products/Cumanday/cumanday2.jpg"> <!-- random image -->
                            <div class="caption left-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Notas florales y afrutadas</h5>
                            </div>
                        </li>                
                        <li>
                            <img src="Resource/Multimedia/Products/Cumanday/cumanday3.jpg"> <!-- random image -->
                            <div class="caption center-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Notas florales y afrutadas</h5>
                            </div>
                        </li>
                        <li>
                            <img src="Resource/Multimedia/Products/Cumanday/cumanday4.jpg"> <!-- random image -->
                            <div class="caption left-align">
                                <h3>!Que buena combinación!</h3>
                                <h5 class="light grey-text text-lighten-3">Notas florales y afrutadas</h5>
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
                            Dorada pálida, brillante, con una espuma duradera, fresca y compleja, refrescante, con notas florales y afrutadas a guayaba manzana, volumen de alcohol: 8º - 9º.
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
