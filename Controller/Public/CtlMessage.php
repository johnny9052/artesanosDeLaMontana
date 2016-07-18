<?php

/*IMPORTS*/
require '../../DTO/Public/MessageDTO.php';
require '../../DAO/Public/MessageDAO.php';
include '../../Helper/Action/Action.php';

/*RECEPCION DE DATOS*/
$action = (isset($_POST['action']) ? $_POST['action'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$email = (isset($_POST['email']) ? $_POST['email'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");

/*DEFINICION DE OBJETOS*/
$obj = new MessageDTO($name,$email,$description);
$dao = new MessageDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


