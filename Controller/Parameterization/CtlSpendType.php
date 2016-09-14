<?php

/* IMPORTS */
require '../../DTO/Parameterization/SpendTypeDTO.php';
require '../../DAO/Parameterization/SpendTypeDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_POST['action']) ? $_POST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");

/* DEFINICION DE OBJETOS */
$obj = new SpendTypeDTO($id, $name, $description);
$dao = new SpendTypeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


