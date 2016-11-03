<?php

/**
 * Definicion de acciones para la gestion de los departmentes
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class DepartmentDAO {

    private $repository;

    function DepartmentDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param DepartmentDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(DepartmentDTO $obj) {
        $query = $this->repository->buildQuerySimply("savedepartment", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param DepartmentDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(DepartmentDTO $obj) {
        $query = $this->repository->buildQuery("listdepartment", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param DepartmentDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(DepartmentDTO $obj) {
        $query = $this->repository->buildQuery("searchdepartment", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param DepartmentDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(DepartmentDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatedepartment", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param DepartmentDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(DepartmentDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletedepartment", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
