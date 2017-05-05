<?php

/* IMPORTS */
require '../../DTO/Parameterization/BeerProductDTO.php';
require '../../DAO/Parameterization/BeerProductDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");
$alcohol = (isset($_POST['alcohol']) ? $_POST['alcohol'] : "");
$amargor = (isset($_POST['amargor']) ? $_POST['amargor'] : "");
$price = (isset($_POST['price']) ? $_POST['price'] : "");
$cantidad = (isset($_POST['cantidad']) ? $_POST['cantidad'] : "");


/* DEFINICION DE OBJETOS */
$obj = new BeerProductDTO($id, $name, $description, $alcohol, $amargor, $price, $cantidad);
$dao = new BeerProductDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


