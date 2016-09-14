<?php

/* IMPORTS */
require '../../DTO/Inventory/InventaryBeerDTO.php';
require '../../DAO/Inventory/InventaryBeerDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_POST['action']) ? $_POST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");

/* DEFINICION DE OBJETOS */
$obj = new InventaryBeerDTO($id);
$dao = new InventaryBeerDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


