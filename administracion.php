<?php
/* Toca colocarlo aqui porque si no el servidor esta mostrando error */
session_start();
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


        <title>Sistema</title>

        <link rel="shortcut icon" type="image/png" href="Resource/Images/Public/favicon.png"/>

        <!--Import materialize.css ONLINE-->
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">-->
        <!--Import materialize.css OFFLINE-->


        <link type="text/css" rel="stylesheet" href="Resource/Framework/Materialize/css/materialize.min.css"  media="screen,projection"/>        

        <!-- Personal Styles -->
        <link href="Resource/Style/General.css" rel="stylesheet">


        <!-- ICONOS ONLINE-->
        <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
        <!-- ICONOS OFFLINE-->
        <link href="Resource/Framework/Materialize/css/icons.css" rel="stylesheet">

        
        <script src="Resource/Framework/Angular/angular.min.js" type="text/javascript"></script>

        <!--Import jQuery before materialize.js ONLINE-->
        <!--<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>-->
        <!--Import jQuery before materialize.js OFFLINE-->
        <script type="text/javascript" src="Resource/Framework/Jquery/jquery-2.1.1.min.js"></script>



        <!--Import materialize.js ONLINE-->
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>-->
        <!--Import materialize.js OFFLINE-->

        <script type="text/javascript" src="Resource/Framework/Materialize/js/materialize.min.js"></script>
        
        <!-- GENERAL JS -->
        
        <script src="Resource/Script/General/GeneralAngular.js" type="text/javascript"></script>
        
        <script defer type="text/javascript" src="Resource/Script/General/General.js"></script>
    </head>
    <body ng-app="appMaster">
        <?php
        if (isset($_SESSION["User"])) {
            include("View/MasterPage.php");
        } else {
            include("View/Security/LogIn.php");
        }
        ?>
        <div class="row center-row">
            <div class="col s12 ">
                <label>
                    <?php
                    if (isset($_GET['MessageLogIn'])) {
                        echo $_GET['MessageLogIn'];
                    }
                    ?>
                </label>
            </div>
        </div>

    </body>
</html>
