<?php

require_once ('../../DTO/BaseDTO.php');

class CityDTO extends BaseDTO {

    private $id;
    private $name;
    private $department;
    private $description;

    public function __Construct($id, $name, $department, $description) {
        $this->id = $id;
        $this->name = $name;
        $this->department = $department;
        $this->description = $description;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getDepartment() {
        return $this->department;
    }

    function getDescription() {
        return $this->description;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setDepartment($department) {
        $this->department = $department;
    }

    function setDescription($description) {
        $this->description = $description;
    }

}
