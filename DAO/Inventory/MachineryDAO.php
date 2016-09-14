<?php

/**
 * Definicion de acciones para la gestion de los machineryes
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class MachineryDAO {

    private $repository;

    function MachineryDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param MachineryDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(MachineryDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveinventary", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getCode(),
            date($obj->getDateIn()),
            (double) $obj->getValue(),
            (int) $obj->getType()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param MachineryDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(MachineryDTO $obj) {
        $query = $this->repository->buildQuery("listinventary", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param MachineryDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(MachineryDTO $obj) {
        $query = $this->repository->buildQuery("searchinventary", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param MachineryDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(MachineryDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateinventary", array((int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getCode(),
            date($obj->getDateIn()),
            (double) $obj->getValue(),
            (int) $obj->getType()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param MachineryDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(MachineryDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteinventary", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
