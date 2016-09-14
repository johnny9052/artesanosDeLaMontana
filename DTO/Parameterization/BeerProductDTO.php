<?php

require_once ('../../DTO/BaseDTO.php');

class BeerProductDTO extends BaseDTO {

    private $id;
    private $name;
    private $description;
    private $alcohol;
    private $amargor;
    private $valor;
    private $cantidad;

    public function __Construct($id, $name, $description, $alcohol, $amargor, $valor, $cantidad) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->alcohol = $alcohol;
        $this->amargor = $amargor;
        $this->valor = $valor;
        $this->cantidad = $cantidad;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getDescription() {
        return $this->description;
    }

    function getAlcohol() {
        return $this->alcohol;
    }

    function getAmargor() {
        return $this->amargor;
    }

    function getValor() {
        return $this->valor;
    }

    function getCantidad() {
        return $this->cantidad;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setAlcohol($alcohol) {
        $this->alcohol = $alcohol;
    }

    function setAmargor($amargor) {
        $this->amargor = $amargor;
    }

    function setValor($valor) {
        $this->valor = $valor;
    }

    function setCantidad($cantidad) {
        $this->cantidad = $cantidad;
    }

}
