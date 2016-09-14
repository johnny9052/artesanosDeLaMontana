<?php

/**
 * Definicion de acciones para la gestion de los inventarytypees
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class InventaryTypeDAO {

    private $repository;

    function InventaryTypeDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param InventaryTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(InventaryTypeDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveinventarytype", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param InventaryTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(InventaryTypeDTO $obj) {
        $query = $this->repository->buildQuery("listinventarytype", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param InventaryTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(InventaryTypeDTO $obj) {
        $query = $this->repository->buildQuery("searchinventarytype", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param InventaryTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(InventaryTypeDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateinventarytype", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param InventaryTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(InventaryTypeDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteinventarytype", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
