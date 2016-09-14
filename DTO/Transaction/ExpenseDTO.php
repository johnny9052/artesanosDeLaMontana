<?php

require_once ('../../DTO/BaseDTO.php');

class ExpenseDTO extends BaseDTO {

    private $id;
    private $typeexpense;
    private $description;
    private $value;
    private $dateExpense;

    function __construct($id, $typeexpense, $description, $value, $dateExpense) {
        $this->id = $id;
        $this->typeexpense = $typeexpense;
        $this->description = $description;
        $this->value = $value;
        $this->dateExpense = $dateExpense;
    }

    function getId() {
        return $this->id;
    }

    function getTypeexpense() {
        return $this->typeexpense;
    }

    function getDescription() {
        return $this->description;
    }

    function getValue() {
        return $this->value;
    }

    function getDateExpense() {
        return $this->dateExpense;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setTypeexpense($typeexpense) {
        $this->typeexpense = $typeexpense;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setValue($value) {
        $this->value = $value;
    }

    function setDateExpense($dateExpense) {
        $this->dateExpense = $dateExpense;
    }

}
