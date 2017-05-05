<?php

/* IMPORTS */
require '../../DTO/Inventory/MachineryDTO.php';
require '../../DAO/Inventory/MachineryDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = ($_REQUEST($_POST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$code = (isset($_POST['code']) ? $_POST['code'] : "");
$dateIn = (isset($_POST['dateIn']) ? $_POST['dateIn'] : "");
$value = (isset($_POST['value']) ? $_POST['value'] : "");
$type = (isset($_POST['type']) ? $_POST['type'] : "");

/* DEFINICION DE OBJETOS */
$obj = new MachineryDTO($id, $name, $code, $dateIn, $value, $type);
$dao = new MachineryDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


