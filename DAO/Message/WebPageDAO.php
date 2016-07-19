<?php

/**
 * Definicion de acciones para la gestion de los roles
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class WebPageDAO {

    private $repository;

    function WebPageDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }


    /**
     * Ejecuta un listar en la base de datos
     * @param RolDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(WebPageDTO $obj) {
        $query = $this->repository->buildQuery("listmessage", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param RolDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(WebPageDTO $obj) {
        $query = $this->repository->buildQuery("searchmessage", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param RolDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(WebPageDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatemessage", array((int) $obj->getId(),
            (string) $obj->getRespuesta(), (int) $obj->getEstado()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param RolDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(WebPageDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletemessage", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
