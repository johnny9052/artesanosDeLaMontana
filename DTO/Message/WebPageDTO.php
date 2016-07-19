<?php

require_once ('../../DTO/BaseDTO.php');

class WebPageDTO extends BaseDTO {

    private $id;
    private $name;
    private $email;
    private $description;
    private $estado;
    private $respuesta;

    public function __Construct($id, $name, $email, $description, $estado, $respuesta) {
        $this->id = $id;
        $this->name = $name;
        $this->email = $email;
        $this->description = $description;
        $this->estado = $estado;
        $this->respuesta = $respuesta;
    }

    function getId() {
        return $this->id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function getName() {
        return $this->name;
    }

    function getDescription() {
        return $this->description;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function getEmail() {
        return $this->email;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function getEstado() {
        return $this->estado;
    }

    function setEstado($estado) {
        $this->estado = $estado;
    }

    function getRespuesta() {
        return $this->respuesta;
    }

    function setRespuesta($respuesta) {
        $this->respuesta = $respuesta;
    }

}
