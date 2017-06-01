<?php

/* IMPORTS */
require '../../DTO/Message/WebPageDTO.php';
require '../../DAO/Message/WebPageDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$email = (isset($_POST['email']) ? $_POST['email'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");
$estado = (isset($_POST['estado']) ? $_POST['estado'] : "");
$respuesta = (isset($_POST['respuesta']) ? $_POST['respuesta'] : "");

/* DEFINICION DE OBJETOS */
$obj = new WebPageDTO($id, $name, $email, $description,$estado,$respuesta);
$dao = new WebPageDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


