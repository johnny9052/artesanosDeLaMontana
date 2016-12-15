<?php

/**
 * Definicion de acciones para la gestion de los machineryes
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class InventaryBeerDAO {

    private $repository;

    function InventaryBeerDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

  
    /**
     * Ejecuta un listar en la base de datos
     * @param InventaryBeerDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(InventaryBeerDTO $obj) {
        $query = $this->repository->buildQuery("listbeerinventary", array((int) $obj->getId()));
        $this->repository->BuildPaginator($query,'');
    }

  
}
