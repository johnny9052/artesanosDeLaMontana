<?php

/**
 * Definicion de acciones para la gestion de los machineryes
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class ExpenseDAO {

    private $repository;

    function ExpenseDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param ExpenseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(ExpenseDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveexpense", array(
            (int) $obj->getId(),
            (int) $obj->getTypeexpense(),
            (string) $obj->getDescription(),
            (double) $obj->getValue(),
            date($obj->getDateExpense())
        ));
        
        //echo $query;
        
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param ExpenseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(ExpenseDTO $obj) {
        $query = $this->repository->buildQuery("listexpense", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query,'');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param ExpenseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(ExpenseDTO $obj) {
        $query = $this->repository->buildQuery("searchexpense", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param ExpenseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(ExpenseDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateexpense", array(
            (int) $obj->getId(),
            (int) $obj->getTypeexpense(),
            (string) $obj->getDescription(),
            (double) $obj->getValue(),
            date($obj->getDateExpense())
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param ExpenseDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(ExpenseDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteexpense", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
