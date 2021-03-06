<?php

/* IMPORTS */
require '../../DTO/Shop/OrderDTO.php';
require '../../DAO/Shop/OrderDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$direccion = (isset($_POST['direccion']) ? $_POST['direccion'] : "");
$products = (isset($_POST['products']) ? $_POST['products'] : "");
$city = (isset($_POST['city']) ? $_POST['city'] : "");
$idclient = (isset($_POST['idclient']) ? $_POST['idclient'] : "");
$estado = (isset($_POST['estado']) ? $_POST['estado'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");
$flag = (isset($_POST['flag']) ? $_POST['flag'] : 0);
$descriptionAdmin = (isset($_POST['descriptionAdmin']) ? $_POST['descriptionAdmin'] : "");

/* DEFINICION DE OBJETOS */
$obj = new OrderDTO($id, $direccion, $products, $city, $idclient, $estado, $description, $flag,$descriptionAdmin);
$dao = new OrderDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


