<?php

/* IMPORTS */
require '../../DTO/Parameterization/CityDTO.php';
require '../../DAO/Parameterization/CityDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$department = (isset($_POST['department']) ? $_POST['department'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");

/* DEFINICION DE OBJETOS */
$obj = new CityDTO($id, $name, $department, $description);
$dao = new CityDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


