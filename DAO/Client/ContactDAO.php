<?php

/**
 * Definicion de acciones para la gestion de los clientes
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class ContactDAO {

    private $repository;

    function ContactDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param ContactDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(ContactDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveclient", array(
            (int) $obj->getId(),
            (int) $obj->getTypeClient(),
            (string) $obj->getName(),
            (string) $obj->getCode(),
            (string) $obj->getEmail(),
            (string) $obj->getAddress(),
            (string) $obj->getPhonenumber(),
            (string) $obj->getDescription()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param ContactDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(ContactDTO $obj) {
        $query = $this->repository->buildQuery("listclient", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query,'');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param ContactDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(ContactDTO $obj) {
        $query = $this->repository->buildQuery("searchclient", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param ContactDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(ContactDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateclient", array(
            (int) $obj->getId(),
            (int) $obj->getTypeClient(),
            (string) $obj->getName(),
            (string) $obj->getCode(),
            (string) $obj->getEmail(),
            (string) $obj->getAddress(),
            (string) $obj->getPhonenumber(),
            (string) $obj->getDescription()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param ContactDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(ContactDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteclient", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Guarda una solicitud de registro de un cliente
     * @param ContactDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Register(ContactDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveclientregister", array(
            (int) $obj->getId(),
            (int) $obj->getTypeClient(),
            (string) $obj->getName(),
            (string) $obj->getCode(),
            (string) $obj->getEmail(),
            (string) $obj->getAddress(),
            (string) $obj->getPhonenumber(),
            md5((string) $obj->getPassword())
        ));


        $this->repository->ExecuteTransaction($query);
    }

}
