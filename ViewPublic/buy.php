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
        <br>
        <div class="container">
            <div class="row">

                <?php
                if (isset($_SESSION['identificationPublic'])) {
                    include("ViewPublic/form/formBuy.php");
                } else {
                    include("ViewPublic/template/v_Message_StartSesion.php");
                }
                ?>

            </div>
    </body>
</html>
