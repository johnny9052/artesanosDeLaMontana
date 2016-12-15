<?php

/**
 * Definicion de acciones para la gestion de los beerines
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class BeerInDAO {

    private $repository;

    function BeerInDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param BeerInDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(BeerInDTO $obj) {
        $query = $this->repository->buildQuerySimply("savebeerin", array(
            (int) $obj->getId(),
            (int) $obj->getBeerType(),
            (int) $obj->getBootle(),
            (string) $obj->getPresentation(),
            (string) $obj->getLote(),
            date($obj->getDateMosto()),
            date($obj->getDateGasificacion()),
            (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param BeerInDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(BeerInDTO $obj) {
        $query = $this->repository->buildQuery("listbeerin", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query,'');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param BeerInDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(BeerInDTO $obj) {
        $query = $this->repository->buildQuery("searchbeerin", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param BeerInDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(BeerInDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatebeerin", array(
            (int) $obj->getId(),
            (int) $obj->getBeerType(),
            (int) $obj->getBootle(),
            (string) $obj->getPresentation(),
            (string) $obj->getLote(),
            date($obj->getDateMosto()),
            date($obj->getDateGasificacion()),
            (string) $obj->getDescription()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param BeerInDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(BeerInDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletebeerin", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
