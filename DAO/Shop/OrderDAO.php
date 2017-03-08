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
            (string) $obj->getDescription(),
            (string) $obj->getProducts() . ","));

        //echo $query;
        $this->repository->ExecuteTransaction($query);

        /* La bandera indica que el pedido fue solicitado desde la pagina web */
        echo $obj->getFlag() . "";
        if ($obj->getFlag() == 1) {
            echo "Entre!!";
            //$this->repository->sendEmailSystem(
              //      $this->repository->getTitleEmailSystemPedido() . $obj->getDireccion(), $obj->getDescription());
        }
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
        $this->repository->BuildPaginator($query, 'detail');
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
     * Ejecuta un buscar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(OrderDTO $obj) {
        $query = $this->repository->buildQuery("searchorder", array((int) $obj->getId()));
        $this->repository->Execute($query);
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

    /**
     * Ejecuta un guardar en la base de datos
     * @param OrderDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function UpdateState(OrderDTO $obj) {
        /* Se debe agregar una coma al final, para que el plsql pueda recorrerlo 
          como un array */
        $query = $this->repository->buildQuerySimply("orderupdatestate", array((int) $obj->getId(),
            (int) $obj->getEstado()));

        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

}
