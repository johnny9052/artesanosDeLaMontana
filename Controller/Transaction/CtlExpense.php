<?php

/* IMPORTS */
require '../../DTO/Transaction/ExpenseDTO.php';
require '../../DAO/Transaction/ExpenseDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_POST['id']) ? $_POST['id'] : "");
$typeexpense = (isset($_POST['typeexpense']) ? $_POST['typeexpense'] : "");
$description = (isset($_POST['description']) ? $_POST['description'] : "");
$value = (isset($_POST['value']) ? $_POST['value'] : "");
$dateExpense = (isset($_POST['dateExpense']) ? $_POST['dateExpense'] : "");

/* DEFINICION DE OBJETOS */
$obj = new ExpenseDTO($id, $typeexpense, $description, $value, $dateExpense);
$dao = new ExpenseDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


