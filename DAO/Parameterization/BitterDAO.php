<?php

/**
 * Definicion de acciones para la gestion de los bitteres
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class BitterDAO {

    private $repository;

    function BitterDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param BitterDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(BitterDTO $obj) {
        $query = $this->repository->buildQuerySimply("savebitter", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param BitterDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(BitterDTO $obj) {
        $query = $this->repository->buildQuery("listbitter", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param BitterDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(BitterDTO $obj) {
        $query = $this->repository->buildQuery("searchbitter", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param BitterDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(BitterDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatebitter", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param BitterDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(BitterDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletebitter", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
