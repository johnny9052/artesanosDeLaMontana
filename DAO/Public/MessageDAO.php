<?php

/**
 * Definicion de acciones para la gestion de los roles
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class MessageDAO {

    private $repository;

    function MessageDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param RolDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(MessageDTO $obj) {
        $query = $this->repository->buildQuerySimply("savepublicmessage", array((string) $obj->getName(),
            (string) $obj->getEmail(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);        
        $this->repository->sendEmailSystem(
                $this->repository->getTitleEmailSystemMessage() . $obj->getName(), $obj->getDescription());
    }

}
