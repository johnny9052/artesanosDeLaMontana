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

/* DEFINICION DE OBJETOS */
$obj = new OrderDTO($id, $direccion, $products);
$dao = new OrderDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


