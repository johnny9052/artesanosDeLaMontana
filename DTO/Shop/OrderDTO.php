<?php

require_once ('../../DTO/BaseDTO.php');

class OrderDTO extends BaseDTO {

    private $id;
    private $direccion;
    private $products;

    public function __Construct($id, $direccion, $products) {
        $this->id = $id;
        $this->direccion = $direccion;
        $this->products = $products;
    }

    function getId() {
        return $this->id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function getProducts() {
        return $this->products;
    }

    function setProducts($name) {
        $this->products = $name;
    }

    function getDireccion() {
        return $this->direccion;
    }

    function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

}
