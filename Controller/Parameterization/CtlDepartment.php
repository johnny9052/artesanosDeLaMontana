<?php

/*IMPORTS*/
require '../../DTO/Parameterization/DepartmentDTO.php';
require '../../DAO/Parameterization/DepartmentDAO.php';
include '../../Helper/Action/Action.php';

/*RECEPCION DE DATOS*/
$action = (isset($_POST['action']) ? $_POST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");

/*DEFINICION DE OBJETOS*/
$obj = new DepartmentDTO($id, $name, $description);
$dao = new DepartmentDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


