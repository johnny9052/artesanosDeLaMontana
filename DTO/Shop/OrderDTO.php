<?php

require_once ('../../DTO/BaseDTO.php');

class OrderDTO extends BaseDTO {

    private $id;
    private $direccion;
    private $products;
    private $city;
    private $idclient;

    function __construct($id, $direccion, $products, $city,$idclient) {
        $this->id = $id;
        $this->direccion = $direccion;
        $this->products = $products;
        $this->city = $city;
        $this->idclient = $idclient;
    }
            
    function getId() {
        return $this->id;
    }

    function getDireccion() {
        return $this->direccion;
    }

    function getProducts() {
        return $this->products;
    }

    function getCity() {
        return $this->city;
    }

    function getIdclient() {
        return $this->idclient;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

    function setProducts($products) {
        $this->products = $products;
    }

    function setCity($city) {
        $this->city = $city;
    }

    function setIdclient($idclient) {
        $this->idclient = $idclient;
    }


    
}
