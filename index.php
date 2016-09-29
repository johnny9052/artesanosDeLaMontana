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



        <!-- MASTER PAGE CONTROL  -->
        <?php
        include("ViewPublic/template/v_navigation.php");


        if (isset($_GET['page'])) {
            include("ViewPublic/" . $_GET['page'] . ".php");
        } else {
            include("ViewPublic/home.php");
        }
        
        
        include("ViewPublic/template/v_modal_coment.php");
        include("ViewPublic/template/v_modal_register.php");
        ?>
        <!--END MASTER PAGE CONTROL  -->




      


    </body>


</html>
