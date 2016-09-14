<?php

require_once ('../../DTO/BaseDTO.php');

class BeerInDTO extends BaseDTO {
        
    private $id;
    private $beerType;
    private $bootle;
    private $presentation;
    private $lote;
    private $dateMosto;
    private $dateGasificacion;
    private $description;

    function __construct($id, $beerType, $bootle, $presentation, $lote, $dateMosto, $dateGasificacion, $description) {        
        $this->id = $id;
        $this->beerType = $beerType;
        $this->bootle = $bootle;
        $this->presentation = $presentation;
        $this->lote = $lote;
        $this->dateMosto = $dateMosto;
        $this->dateGasificacion = $dateGasificacion;
        $this->description = $description;
    }
    
    function getId() {
        return $this->id;
    }

    function getBeerType() {
        return $this->beerType;
    }

    function getBootle() {
        return $this->bootle;
    }

    function getPresentation() {
        return $this->presentation;
    }

    function getLote() {
        return $this->lote;
    }

    function getDateMosto() {
        return $this->dateMosto;
    }

    function getDateGasificacion() {
        return $this->dateGasificacion;
    }

    function getDescription() {
        return $this->description;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setBeerType($beerType) {
        $this->beerType = $beerType;
    }

    function setBootle($bootle) {
        $this->bootle = $bootle;
    }

    function setPresentation($presentation) {
        $this->presentation = $presentation;
    }

    function setLote($lote) {
        $this->lote = $lote;
    }

    function setDateMosto($dateMosto) {
        $this->dateMosto = $dateMosto;
    }

    function setDateGasificacion($dateGasificacion) {
        $this->dateGasificacion = $dateGasificacion;
    }

    function setDescription($description) {
        $this->description = $description;
    }



}
