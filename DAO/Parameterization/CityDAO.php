<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class CityDAO {

    private $repository;

    function CityDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param CityDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(CityDTO $obj) {
        $query = $this->repository->buildQuerySimply("savecity", array((int) $obj->getId(),
            (string) $obj->getName(),
            (int) $obj->getDepartment(),
            (string) $obj->getDescription()));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param CityDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(CityDTO $obj) {
        $query = $this->repository->buildQuery("listcity", array((int) $obj->getId()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param CityDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(CityDTO $obj) {
        $query = $this->repository->buildQuery("searchcity", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param CityDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(CityDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatecity", array((int) $obj->getId(),
            (string) $obj->getName(),
            (int) $obj->getDepartment(),
            (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param CityDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(CityDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletecity", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
