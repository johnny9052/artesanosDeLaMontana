<?php

/* IMPORTS */
require '../../DTO/Shop/OrderDTO.php';
require '../../DAO/Shop/OrderDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_POST['action']) ? $_POST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$direccion = (isset($_POST['direccion']) ? $_POST['direccion'] : "");
$products = (isset($_POST['products']) ? $_POST['products'] : "");
$city = (isset($_POST['city']) ? $_POST['city'] : "");
$idclient = (isset($_POST['idclient']) ? $_POST['idclient'] : "");
$estado = (isset($_POST['estado']) ? $_POST['estado'] : "");

/* DEFINICION DE OBJETOS */
$obj = new OrderDTO($id, $direccion, $products, $city, $idclient, $estado);
$dao = new OrderDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


