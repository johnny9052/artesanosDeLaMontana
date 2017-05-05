<?php

/* IMPORTS */
require '../../DTO/Parameterization/InventaryTypeDTO.php';
require '../../DAO/Parameterization/InventaryTypeDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");

/* DEFINICION DE OBJETOS */
$obj = new InventaryTypeDTO($id, $name, $description);
$dao = new InventaryTypeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


