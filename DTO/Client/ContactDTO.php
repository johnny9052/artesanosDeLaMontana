<?php

require_once ('../../DTO/BaseDTO.php');

class ContactDTO extends BaseDTO {

    private $id;
    private $typeClient;
    private $name;
    private $code;
    private $email;
    private $address;
    private $phonenumber;
    private $description;
    private $password;

    function __construct($id, $typeClient, $name, $code, $email, $address, $phonenumber, $description, $password) {
        $this->id = $id;
        $this->typeClient = $typeClient;
        $this->name = $name;
        $this->code = $code;
        $this->email = $email;
        $this->address = $address;
        $this->phonenumber = $phonenumber;
        $this->description = $description;
        $this->password = $password;
    }

    function getId() {
        return $this->id;
    }

    function getTypeClient() {
        return $this->typeClient;
    }

    function getName() {
        return $this->name;
    }

    function getCode() {
        return $this->code;
    }

    function getEmail() {
        return $this->email;
    }

    function getAddress() {
        return $this->address;
    }

    function getPhonenumber() {
        return $this->phonenumber;
    }

    function getDescription() {
        return $this->description;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setTypeClient($typeClient) {
        $this->typeClient = $typeClient;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setCode($code) {
        $this->code = $code;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setPhonenumber($phonenumber) {
        $this->phonenumber = $phonenumber;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function getPassword() {
        return $this->password;
    }

    function setPassword($password) {
        $this->password = $password;
    }

}
