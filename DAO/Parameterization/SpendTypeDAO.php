<?php

/**
 * Definicion de acciones para la gestion de los spendtypees
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class SpendTypeDAO {

    private $repository;

    function SpendTypeDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param SpendTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(SpendTypeDTO $obj) {
        $query = $this->repository->buildQuerySimply("savespendtype", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param SpendTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(SpendTypeDTO $obj) {
        $query = $this->repository->buildQuery("listspendtype", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginator($query,'');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param SpendTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(SpendTypeDTO $obj) {
        $query = $this->repository->buildQuery("searchspendtype", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param SpendTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(SpendTypeDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatespendtype", array((int) $obj->getId(),
            (string) $obj->getName(), (string) $obj->getDescription()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param SpendTypeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(SpendTypeDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletespendtype", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
