<?php

require_once ('../../DTO/BaseDTO.php');

class MachineryDTO extends BaseDTO {
    
    private $id;
    private $name;
    private $code;
    private $dateIn;
    private $value;
    private $type;
    
    
    function __construct($id, $name, $code, $dateIn, $value, $type) {
        $this->id = $id;
        $this->name = $name;
        $this->code = $code;
        $this->dateIn = $dateIn;
        $this->value = $value;
        $this->type = $type;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getCode() {
        return $this->code;
    }

    function getDateIn() {
        return $this->dateIn;
    }

    function getValue() {
        return $this->value;
    }

    function getType() {
        return $this->type;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setCode($code) {
        $this->code = $code;
    }

    function setDateIn($dateIn) {
        $this->dateIn = $dateIn;
    }

    function setValue($value) {
        $this->value = $value;
    }

    function setType($type) {
        $this->type = $type;
    }


    
    
}
