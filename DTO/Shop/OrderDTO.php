<?php

require_once ('../../DTO/BaseDTO.php');

class OrderDTO extends BaseDTO {

    private $id;
    private $direccion;
    private $products;
    private $city;
    private $idclient;
    private $estado;
    private $description;
    private $flag;
    private $descriptionAdmin;

    function __construct($id, $direccion, $products, $city, $idclient, $estado, $description, $flag, $descriptionAdmin) {
        $this->id = $id;
        $this->direccion = $direccion;
        $this->products = $products;
        $this->city = $city;
        $this->idclient = $idclient;
        $this->estado = $estado;
        $this->description = $description;
        $this->flag = $flag;
        $this->descriptionAdmin = $descriptionAdmin;
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

    function getEstado() {
        return $this->estado;
    }

    function setEstado($estado) {
        $this->estado = $estado;
    }

    function getDescription() {
        return $this->description;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function getFlag() {
        return $this->flag;
    }

    function setFlag($flag) {
        $this->flag = $flag;
    }
    
    function getDescriptionAdmin() {
        return $this->descriptionAdmin;
    }

    function setDescriptionAdmin($descriptionAdmin) {
        $this->descriptionAdmin = $descriptionAdmin;
    }



}
