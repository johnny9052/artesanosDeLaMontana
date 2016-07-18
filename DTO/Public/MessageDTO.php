<?php

require_once ('../../DTO/BaseDTO.php');

class MessageDTO extends BaseDTO {

    private $name;
    private $email;
    private $description;

    public function __Construct($name, $email, $description) {
        $this->name = $name;
        $this->email = $email;
        $this->description = $description;
    }

    
    function getName() {
        return $this->name;
    }

    function setName($name) {
        $this->name = $name;
    }
    
    
    function getEmail() {
        return $this->email;
    }

    function setEmail($email) {
        $this->email = $email;
    }


    function getDescription() {
        return $this->description;
    }

    function setDescription($description) {
        $this->description = $description;
    }

}
