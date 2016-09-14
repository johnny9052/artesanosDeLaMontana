<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class BeerProductDAO {

    private $repository;

    function BeerProductDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param BeerProductDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(BeerProductDTO $obj) {
        $query = $this->repository->buildQuerySimply("savebeerproduct", array(
            (int) $obj->getId(),
            (string) $obj->getName(), 
            (string) $obj->getDescription(),
            (double) $obj->getAlcohol(), 
            (int) $obj->getAmargor(),
            (double) $obj->getValor(),             
            (double) $obj->getCantidad()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param BeerProductDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(BeerProductDTO $obj) {
        $query = $this->repository->buildQuery("listbeerproduct", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param BeerProductDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(BeerProductDTO $obj) {
        $query = $this->repository->buildQuery("searchbeerproduct", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param BeerProductDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(BeerProductDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatebeerproduct", array(
            (int) $obj->getId(),
            (string) $obj->getName(), 
            (string) $obj->getDescription(),
            (double) $obj->getAlcohol(), 
            (int) $obj->getAmargor(),
            (double) $obj->getValor(),             
            (double) $obj->getCantidad()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param BeerProductDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(BeerProductDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletebeerproduct", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
