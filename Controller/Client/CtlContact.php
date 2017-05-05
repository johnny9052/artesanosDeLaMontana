<?php

/* IMPORTS */
require '../../DTO/Client/ContactDTO.php';
require '../../DAO/Client/ContactDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$typeClient = (isset($_POST['typeClient']) ? $_POST['typeClient'] : "");
$name = (isset($_POST['name']) ? $_POST['name'] : "");
$code = (isset($_POST['code']) ? $_POST['code'] : "");
$email = (isset($_POST['email']) ? $_POST['email'] : "");
$address = (isset($_POST['address']) ? $_POST['address'] : "");
$phonenumber = (isset($_POST['phonenumber']) ? $_POST['phonenumber'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");
$password = (isset($_POST['passwordRegister']) ? $_POST['passwordRegister'] : "");


/* DEFINICION DE OBJETOS */
$obj = new ContactDTO($id, $typeClient, $name, $code, $email, $address, $phonenumber, $description,$password);
$dao = new ContactDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


