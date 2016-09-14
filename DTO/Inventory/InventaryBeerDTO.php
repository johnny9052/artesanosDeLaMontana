<?php

require_once ('../../DTO/BaseDTO.php');

class InventaryBeerDTO extends BaseDTO {
    
    private $id;
    
    
    function __construct($id) {
        $this->id = $id;
    }
    
    
    
    function getId() {
        return $this->id;
    }

    function setId($id) {
        $this->id = $id;
    }


    
     
    
}
