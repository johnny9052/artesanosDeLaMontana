<?php

/**
 * Definicion de acciones para la gestion de los orderes
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
        $query = $this->repository->buildQuerySimply("saveorder", array((int) $obj->getIdclient(),
            (string) $obj->getDireccion(),
            (int) $obj->getCity(),
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
        $query = $this->repository->buildQuery("listorder", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query,'detail');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(OrderDTO $obj) {
        $query = $this->repository->buildQuery("searchorderproduct", array((int) $obj->getId()));
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
        $query = $this->repository->buildQuerySimply("updateorder", array((int) $obj->getId(),
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
        $query = $this->repository->buildQuerySimply("deleteorder", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Detail(OrderDTO $obj) {
        $query = $this->repository->buildQuery("searchorderproduct", array((int) $obj->getId()));
        $this->repository->BuildDetail($query);
    }

}
