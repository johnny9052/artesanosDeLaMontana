<?php

/*IMPORTS*/
require '../../DTO/Brewery/BeerInDTO.php';
require '../../DAO/Brewery/BeerInDAO.php';
include '../../Helper/Action/Action.php';

/*RECEPCION DE DATOS*/
$action = (isset($_POST['action']) ? $_POST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$beerType = (isset($_POST['beerType']) ? $_POST['beerType'] : "");
$bootle = (isset($_POST['bootle']) ? $_POST['bootle'] : "");
$presentation = (isset($_POST['presentation']) ? $_POST['presentation'] : "");
$lote = (isset($_POST['lote']) ? $_POST['lote'] : "");
$dateMosto = (isset($_POST['dateMosto']) ? $_POST['dateMosto'] : "");
$dateGasificacion = (isset($_POST['dateGasificacion']) ? $_POST['dateGasificacion'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");

/*DEFINICION DE OBJETOS*/
$obj = new BeerInDTO($id, $beerType, $bootle, $presentation, $lote, $dateMosto, 
        $dateGasificacion, $description);
$dao = new BeerInDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


