<?php

/**
 * Definicion de acciones para la gestion de los roles
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class OrderDAO {

    private $repository;

    function OrderDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(OrderDTO $obj) {
        /* Se debe agregar una coma al final, para que el plsql pueda recorrerlo 
          como un array */
        $query = $this->repository->buildQuerySimply("saveorder", array((int) $obj->getId(),
            (string) $obj->getDireccion(),
            (string) $obj->getProducts() . ","));
        
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(OrderDTO $obj) {
        $query = $this->repository->buildQuery("listrol", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(OrderDTO $obj) {
        $query = $this->repository->buildQuery("searchrol", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(OrderDTO $obj) {
        $query = $this->repository->buildQuerySimply("updaterol", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(OrderDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleterol", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
