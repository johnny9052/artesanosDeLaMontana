-- CAMBIAR EL TIPO DE UNA TABLA
SET storage_engine=MYISAM;
ALTER TABLE menu ENGINE = MyISAM;
ALTER TABLE menu ENGINE = InnoDB;


-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: proyectoInicial
-- Source Schemata: proyectoInicial
-- Created: Wed Jun 22 17:40:29 2016
-- Workbench Version: 6.3.7
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema proyectoInicial
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `proyectoInicial` ;
CREATE SCHEMA IF NOT EXISTS `proyectoInicial` ;

-- ----------------------------------------------------------------------------
-- Table proyectoInicial.menu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoInicial`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `codigo` VARCHAR(2000) NULL,
  `padre` INT NULL,
  `descripcion` VARCHAR(2000) NULL,
  `prioridad` INT NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table proyectoInicial.menu_rol
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoInicial`.`menu_rol` (
  `idrol` INT NULL,
  `idmenu` INT NULL,
  CONSTRAINT `menu_usuario_idmenu_fkey`
    FOREIGN KEY (`idmenu`)
    REFERENCES `proyectoInicial`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_usuario_idrol_fkey`
    FOREIGN KEY (`idrol`)
    REFERENCES `proyectoInicial`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table proyectoInicial.rol
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoInicial`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table proyectoInicial.usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoInicial`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `primer_nombre` VARCHAR(50) NULL,
  `segundo_nombre` VARCHAR(50) NULL,
  `primer_apellido` VARCHAR(50) NULL,
  `segundo_apellido` VARCHAR(50) NULL,
  `usuario` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL,
  `rol` INT NULL,
  `descripcion` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `usuario_rol_fkey`
    FOREIGN KEY (`rol`)
    REFERENCES `proyectoInicial`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
SET FOREIGN_KEY_CHECKS = 1;





DROP PROCEDURE IF EXISTS login;
DELIMITER //
CREATE PROCEDURE login(usu VARCHAR(50), pass VARCHAR(50))
COMMENT 'Procedimiento que valida las credenciales de un usuairo'
BEGIN
   select usuario,primer_nombre,primer_apellido,rol from usuario where password=pass and usuario=usu;		
END//

DELIMITER ;



DELIMITER //
CREATE FUNCTION deleterol(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un rol'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
    delete from rol where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;





DELIMITER //
CREATE FUNCTION deleteuser(vid INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que elimina un usuario'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM usuario WHERE id = vid;
SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE listrol(iduser int)
COMMENT 'Procedimiento que lista los roles de un determinado usuario'
BEGIN
   select id,nombre as nombre_rol,descripcion 
   from rol
   order by nombre;
END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE listuser(iduser int)
COMMENT 'Procedimiento que lista los usuarios'
BEGIN
   
	SELECT us.id, us.primer_nombre as primer_nombre, us.primer_apellido as primer_apellido, us.usuario as nickname, r.nombre as rol, 
	       us.descripcion as descripcion
	FROM usuario as us
	INNER JOIN rol as r on r.id = us.rol
	ORDER BY us.primer_nombre;

END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE loadallmenu()
COMMENT 'Procedimiento que lista todos los menus del sistema'
BEGIN
   
	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,m.prioridad
	from menu as m
	left JOIN menu as m2 on m.padre = m2.id	
	order by m.prioridad;

END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE loadapage(vpage varchar(2000),vrol int)
COMMENT 'Procedimiento que lista los menus'
BEGIN
   
	select m.codigo
	from menu as m 	
	inner join menu_rol as mr on mr.idmenu = m.id
	where mr.idrol = vrol AND m.codigo = vpage;	

END//

DELIMITER ;














DELIMITER //
CREATE PROCEDURE loadmenu(rol int)
COMMENT 'Procedimiento que lista los menus de un determinado rol'
BEGIN
   
	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,mr.idrol,m.prioridad
	from menu as m
	left JOIN menu as m2 on m.padre = m2.id
	LEFT join menu_rol as mr on mr.idmenu = m.id
	where (mr.idrol = rol OR (m.padre = -1 AND (mr.idrol = rol OR mr.idrol IS NULL)))
	order by m.prioridad;
END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE loadrol(idfilter int)
COMMENT 'Procedimiento que lista los roles'
BEGIN
 
	IF idfilter > -1 THEN
	
		select id,nombre
		from rol
		ORDER BY nombre;
		
   ELSE	
	
		select id,nombre
		from rol
		ORDER BY nombre;
	
   END IF;

END//

DELIMITER ;









DELIMITER //
CREATE FUNCTION saverol(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un rol'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from rol where nombre=nom)
		THEN
			insert into rol(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;











DELIMITER //
CREATE FUNCTION saveuser(id int, vfirstname varchar(50), vsecondname varchar(50), vfirstlastname varchar(50), vsecondlastname varchar(50), vuser varchar(50), vpass varchar(50), vrol int, vdescription varchar(50)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un rol'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select usuario from usuario where usuario=vuser)
		THEN
			insert into usuario(primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
					   usuario, password, rol,descripcion)
			VALUES (vfirstname,vsecondname,vfirstlastname,vsecondlastname,vuser,vpass,vrol,vdescription);
			set res = 1;
			
				
			
		END IF;

	RETURN res;
	
	

END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE searchrol(idrol int)
COMMENT 'Procedimiento que carga la informacion de un rol'
BEGIN
 
	
	select id,nombre,descripcion
	from rol
	where id = idrol;
	
END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE searchuser(vid int)
COMMENT 'Procedimiento que carga la informacion de un usuario'
BEGIN
 	
	SELECT id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
	usuario, rol, descripcion
	FROM usuario
	where id = vid;	
	
END//

DELIMITER ;








DELIMITER //
CREATE FUNCTION updaterol(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un rol'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from rol where nombre=nom and id<>cod)
		THEN
			update rol set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;









DELIMITER //
CREATE FUNCTION updateuser(vid int, vfirstname varchar(50), vsecondname varchar(50), vfirstlastname varchar(50), vsecondlastname varchar(50), vuser varchar(50), vpass varchar(50), vrol int, vdescription varchar(50)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un rol'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select usuario from usuario where usuario=vuser and id<>vid)
		THEN

UPDATE usuario
   SET  primer_nombre=vfirstname, segundo_nombre=vsecondname, primer_apellido=vfirstlastname, segundo_apellido=vsecondlastname, 
       usuario=vuser, password= vpass, rol=vrol, descripcion=vdescription
 WHERE id=vid;

			
			set res=1;
								
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;










DELIMITER //
CREATE FUNCTION  updatepermission (vid integer, vpermission varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que actualiza los permisos de un rol'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    /*Variable que contendra el permiso a almacenar*/
    DECLARE permiso varchar(50) DEFAULT '';    

    /*Se borra todos los permisos existentes del usuario*/
    delete from menu_rol where idrol = vid;
    
    WHILE (LOCATE(',', vpermission) > 0) DO
        /*Se saca el primer campo separado por coma del varchar*/
    	SET permiso = ELT(1, vpermission);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vpermission = SUBSTRING(vpermission, LOCATE(',',vpermission) + 1);
        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
		IF permiso <> ',' THEN	
    		INSERT INTO menu_rol(idrol, idmenu) VALUES (vid, permiso);
		END IF;
    END WHILE;

    SET res = 1;

    RETURN res;	
END//

DELIMITER ;






CREATE TABLE IF NOT EXISTS `artesano_proyectoinicial`.`mensaje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `email` VARCHAR(50) NULL,
  `descripcion` VARCHAR(2000) NULL,
  `respuesta` VARCHAR(2000) NULL,
  `estado` bit NULL,
  PRIMARY KEY (`id`));



DELIMITER //
CREATE FUNCTION savepublicmessage(nom varchar(50),email varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un mensaje enviado por un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    insert into mensaje(nombre,email,descripcion,estado) values(nom,email,des,0);	
    set res = 1;								
    RETURN res;	
END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE listmessage(iduser int)
COMMENT 'Procedimiento que lista los mensajes'
BEGIN
   
	SELECT id, nombre as nombre_solicitante, descripcion, respuesta,CASE estado 
             WHEN 1 THEN 'Cerrado' 
 	     ELSE 'Abierto' END as estado
	FROM mensaje;
	

END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE searchmessage(vid int)
COMMENT 'Procedimiento que carga la informacion de un mensaje'
BEGIN
 	
	SELECT id, nombre, email, descripcion,respuesta, estado
	FROM mensaje
	where id = vid;	
	
END//

DELIMITER ;








DELIMITER //
CREATE FUNCTION updatemessage(cod INT,resp varchar(2000),est INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que actualiza el estado de un mensaje de un usuario'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
    update mensaje set respuesta = resp, estado = est where id = cod;		
    set res=1;
												
    RETURN res;
	
END//

DELIMITER ;




DELIMITER //
CREATE FUNCTION deletemessage(vid INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que elimina un mensaje'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM mensaje WHERE id = vid;
SET res = 1;
	RETURN res;
END//

DELIMITER ;





-- ----------------------------------------------------------------------------
-- Table proyectoInicial.rol
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS amargor (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`));


insert into amargor(nombre,descripcion) values('bajo','');
insert into amargor(nombre,descripcion) values('medio','');
insert into amargor(nombre,descripcion) values('alto','');



DELIMITER //
CREATE PROCEDURE loadamargor(idfilter int)
COMMENT 'Procedimiento que lista los amargores'
BEGIN
 
	IF idfilter > -1 THEN
	
		select id,nombre
		from amargor
		ORDER BY nombre;
		
   ELSE	
	
		select id,nombre
		from amargor
		ORDER BY nombre;
	
   END IF;

END//

DELIMITER ;






-- ----------------------------------------------------------------------------
-- Table proyectoInicial.menu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS tipo_cerveza (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(2000) NOT NULL,
  `alcohol` DOUBLE NOT NULL,
  `amargor` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `cantidad` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`amargor`) REFERENCES amargor(id)
 );






DELIMITER //
CREATE FUNCTION savebeerproduct(id int, vname varchar(50), vdescription varchar(2000),valcohol double, vamargor int,
                                    vvalor double, vcantidad double) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena tipo de cerveza'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select vname from tipo_cerveza where nombre=vname)
		THEN
			insert into tipo_cerveza(nombre, descripcion, alcohol, amargor, 
					   valor, cantidad)
			VALUES (vname,vdescription,valcohol,vamargor,vvalor,vcantidad);
			set res = 1;										
		END IF;

	RETURN res;		
END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE listbeerproduct(iduser int)
COMMENT 'Procedimiento que lista los tipos de cerveza '
BEGIN
   select tip.id,tip.nombre,tip.descripcion, tip.alcohol as 'alcohol (%)', 
          am.nombre  as 'amargor', tip.valor as 'valor $', tip.cantidad as 'cantidad (ml)'
   from tipo_cerveza as tip
   inner join amargor as am on am.id = tip.amargor
   order by tip.nombre;
END//

DELIMITER ;


 


DELIMITER //
CREATE PROCEDURE searchbeerproduct(idbeerproduct int)
COMMENT 'Procedimiento que carga la informacion de un tipo de cerveza'
BEGIN
 
	
	select  id,nombre,descripcion,alcohol,amargor,valor,cantidad
	from tipo_cerveza
	where id = idbeerproduct;
	
END//

DELIMITER ;






DELIMITER //
CREATE FUNCTION updatebeerproduct(vid int, vname varchar(50), vdescription varchar(2000),valcohol double, vamargor int,
                                    vvalor double, vcantidad double) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un tipo de cerveza'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_cerveza where nombre=vname and id<>vid)
		THEN
			update tipo_cerveza set nombre = vname,
                               descripcion = vdescription,
                               alcohol = valcohol,
                               amargor = vamargor,
                               valor = vvalor,
                               cantidad = vcantidad
                               where id = vid;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;






DELIMITER //
CREATE FUNCTION deletebeerproduct(vid INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un tipo de cerveza'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
        delete from tipo_cerveza where id = vid;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;





-- ----------------------------------------------------------------------------
-- Table proyectoInicial.menu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS tipo_inventario (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`)
 );

insert into tipo_inventario(nombre,descripcion) values('Materia prima','');
insert into tipo_inventario(nombre,descripcion) values('Insumo','');
insert into tipo_inventario(nombre,descripcion) values('Utencilios','');
insert into tipo_inventario(nombre,descripcion) values('Equipos','');


-- ----------------------------------------------------------------------------
-- Table proyectoInicial.menu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS inventario (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo` INT NOT NULL, 
  `nombre` VARCHAR(50) NOT NULL,
  `codigo` VARCHAR(50) NOT NULL,
  `fecha_adquisicion` date NOT NULL,
  `costo` DOUBLE NOT NULL,  
   PRIMARY KEY (`id`),
   FOREIGN KEY (`id_tipo`) REFERENCES tipo_inventario(id)
 );








DELIMITER //
CREATE PROCEDURE loadtypeinventary(idfilter int)
COMMENT 'Procedimiento que lista los tipos de inventario'
BEGIN
 
	IF idfilter > -1 THEN
	
		select id,nombre
		from tipo_inventario
		ORDER BY nombre;
		
   ELSE	
	
		select id,nombre
		from tipo_inventario
		ORDER BY nombre;
	
   END IF;

END//

DELIMITER ;









DELIMITER //
CREATE FUNCTION saveinventary(vid int, vname varchar(50), vcode varchar(50),vdate date,
                                    vvalor double, vtype int) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena inventarios'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select codigo from inventario where codigo=vcode)
		THEN
			insert into inventario(id_tipo,nombre, codigo, 
                                               fecha_adquisicion,costo)
			VALUES (vtype,vname,vcode,vdate,vvalor);
			set res = 1;										
		END IF;

	RETURN res;		
END//

DELIMITER ;









DELIMITER //
CREATE PROCEDURE listinventary(iduser int)
COMMENT 'Procedimiento que lista los inventarios '
BEGIN
   select inv.id,inv.nombre,tip.nombre as 'tipo', inv.codigo, 
          inv.fecha_adquisicion as 'fecha entrada', 
          inv.costo as '$ valor'
   from inventario as inv
   inner join tipo_inventario as tip on tip.id = inv.id_tipo
   order by inv.codigo;
END//

DELIMITER ;




DELIMITER //
CREATE PROCEDURE searchinventary(idinventary int)
COMMENT 'Procedimiento que carga la informacion de un inventario'
BEGIN 
	select  id,id_tipo,nombre, codigo,fecha_adquisicion,costo
	from inventario
	where id = idinventary;
	
END//

DELIMITER ;










DELIMITER //
CREATE FUNCTION updateinventary(vid int, vname varchar(50), vcode varchar(50),vdate date,
                                    vvalor double, vtype int) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un inventario'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from inventario where codigo=vcode and id<>vid)
		THEN
			update inventario set nombre = vname,
                               id_tipo = vtype,
                               nombre= vname, 
                               codigo = vcode,
                               fecha_adquisicion=vdate,
                               costo = vvalor
                               where id = vid;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION deleteinventary(vid INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un inventario'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
        delete from inventario where id = vid;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;










DELIMITER //
CREATE FUNCTION savebitter(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un nivel de amargor'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from amargor where nombre=nom)
		THEN
			insert into amargor(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE listbitter(iduser int)
COMMENT 'Procedimiento que lista los niveles de amargor'
BEGIN
   select id,nombre as 'nombre amargor',descripcion 
   from amargor
   order by nombre;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION deletebitter(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un nivel de amargor'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
    delete from amargor where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updatebitter(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un nivel de amargor'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from amargor where nombre=nom and id<>cod)
		THEN
			update amargor set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE searchbitter(idbitter int)
COMMENT 'Procedimiento que carga la informacion de un rol'
BEGIN
 
	
	select id,nombre,descripcion
	from amargor
	where id = idbitter;
	
END//

DELIMITER ;









DELIMITER //
CREATE FUNCTION saveinventarytype(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un nivel de tipo_inventario'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_inventario where nombre=nom)
		THEN
			insert into tipo_inventario(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE listinventarytype(iduser int)
COMMENT 'Procedimiento que lista los niveles de tipo_inventario'
BEGIN
   select id,nombre as 'nombre tipo_inventario',descripcion 
   from tipo_inventario
   order by nombre;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION deleteinventarytype(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un nivel de tipo_inventario'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
    delete from tipo_inventario where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updateinventarytype(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un nivel de tipo_inventario'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_inventario where nombre=nom and id<>cod)
		THEN
			update tipo_inventario set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE searchinventarytype(idinventarytype int)
COMMENT 'Procedimiento que carga la informacion de un rol'
BEGIN
 
	
	select id,nombre,descripcion
	from tipo_inventario
	where id = idinventarytype;
	
END//

DELIMITER ;




CREATE TABLE IF NOT EXISTS tipo_gasto (
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(50) NULL,
   descripcion VARCHAR(2000) NULL,
  PRIMARY KEY (id));



INSERT INTO tipo_gasto(nombre,descripcion) values ('Servicios publicos','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Insumos','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Materias primas','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Eventos','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Publicidad','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Transporte','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Gastos administrativos','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Obligaciones legales','');
INSERT INTO tipo_gasto(nombre,descripcion) values ('Mantenimiento','');



DELIMITER //
CREATE FUNCTION savespendtype(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un nivel de tipo_gasto'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_gasto where nombre=nom)
		THEN
			insert into tipo_gasto(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE listspendtype(iduser int)
COMMENT 'Procedimiento que lista los niveles de tipo_gasto'
BEGIN
   select id,nombre as 'nombre tipo_gasto',descripcion 
   from tipo_gasto
   order by nombre;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION deletespendtype(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un nivel de tipo_gasto'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
    delete from tipo_gasto where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updatespendtype(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un nivel de tipo_gasto'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_gasto where nombre=nom and id<>cod)
		THEN
			update tipo_gasto set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE searchspendtype(idspendtype int)
COMMENT 'Procedimiento que carga la informacion de un tipo_gasto'
BEGIN
 
	
	select id,nombre,descripcion
	from tipo_gasto
	where id = idspendtype;
	
END//

DELIMITER ;






CREATE TABLE IF NOT EXISTS entrada_cerveza (
   id INT NOT NULL AUTO_INCREMENT,
   id_tipo_cerveva int not null,
   cantidad int not null,   
   presentacion VARCHAR(50) NULL,
   lote VARCHAR(50) NULL,
   fecha_fabricacion date not null,
   fecha_gasificacion date not null,
   observaciones VARCHAR(2000) NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (id_tipo_cerveva) REFERENCES tipo_cerveza (id)
  );



DELIMITER //
CREATE PROCEDURE loadbeertype(idfilter int)
COMMENT 'Procedimiento que lista los tipos de cerveza'
BEGIN 
	IF idfilter > -1 THEN	
		select id,nombre
		from tipo_cerveza
		ORDER BY nombre;		
        ELSE		
		select id,nombre
		from tipo_cerveza
		ORDER BY nombre;	
   END IF;
END//
DELIMITER ;









DELIMITER //
CREATE FUNCTION savebeerin(vid INT,vBeerType INT, vBootle INT, 
                           vPresentation varchar(50), vLote varchar(50), 
                           vDateMosto date, vDateGasificacion date, 
                           vDescription varchar(2000)
                           ) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena una entrada de cerveza'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select lote from entrada_cerveza where lote=vLote)
		THEN
			insert into entrada_cerveza(id_tipo_cerveva,cantidad,
                                           presentacion,lote,fecha_fabricacion, 
                                           fecha_gasificacion,observaciones) 
                               values(vBeerType,vBootle,vPresentation,vLote, 
                                      vDateMosto,vDateGasificacion,vDescription);
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;









DELIMITER //
CREATE PROCEDURE listbeerin(iduser int)
COMMENT 'Procedimiento que lista las entradas de cerveza'
BEGIN
   select cerv.id, tip.nombre as 'tipo cerveza',cerv.cantidad,
          cerv.presentacion,cerv.lote,cerv.fecha_fabricacion,
          cerv.fecha_gasificacion,cerv.observaciones
   from entrada_cerveza cerv
   join tipo_cerveza as tip on cerv.id_tipo_cerveva = tip.id  
   order by nombre;
END//

DELIMITER ;






DELIMITER //
CREATE PROCEDURE searchbeerin(idbeerin int)
COMMENT 'Procedimiento que carga la informacion de una entrada de cerveza'
BEGIN
 
	
	select id,id_tipo_cerveva,cantidad,presentacion,lote,fecha_fabricacion, 
               fecha_gasificacion,observaciones
	from entrada_cerveza
	where id = idbeerin;
	
END//

DELIMITER ;









DELIMITER //
CREATE FUNCTION deletebeerin(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina una entrada de una cerveza'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
        delete from entrada_cerveza where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updatebeerin(vid INT,vBeerType INT, vBootle INT, 
                           vPresentation varchar(50), vLote varchar(50), 
                           vDateMosto date, vDateGasificacion date, 
                           vDescription varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica una entrada de una cerveza'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select id from entrada_cerveza where lote=vLote and id<>vid)
		THEN
			update entrada_cerveza set 
                               id_tipo_cerveva = vBeerType,
                               cantidad = vBootle,
                               presentacion = vPresentation,
                               lote = vLote,
                               fecha_fabricacion = vDateMosto, 
                               fecha_gasificacion = vDateGasificacion,
                               observaciones = vDescription
                        where id = vid;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE listbeerinventary(iduser int)
COMMENT 'Procedimiento que calcula y lista el total de cervezas disponibles'
BEGIN
        select tip.id, tip.nombre as 'tipo', SUM(ent.cantidad) as 'cantidad disponible'
        from entrada_cerveza as ent
        inner join tipo_cerveza as tip on ent.id_tipo_cerveva = tip.id
        group by tip.nombre
        order by tip.nombre;
END//
DELIMITER ;




CREATE TABLE IF NOT EXISTS tipo_cliente (
   id INT NOT NULL AUTO_INCREMENT,   
   nombre VARCHAR(50) NULL,
   descripcion VARCHAR(2000) NULL,
   PRIMARY KEY (id)
  );

insert into tipo_cliente (nombre,descripcion) values ('Empresa','');
insert into tipo_cliente (nombre,descripcion) values ('Persona natural','');



DELIMITER //
CREATE PROCEDURE loadclienttype(idfilter int)
COMMENT 'Procedimiento que lista los tipos de cliente'
BEGIN 
	IF idfilter > -1 THEN	
		select id,nombre
		from tipo_cliente
		ORDER BY nombre;		
        ELSE		
		select id,nombre
		from tipo_cliente
		ORDER BY nombre;	
   END IF;
END//
DELIMITER ;


CREATE TABLE IF NOT EXISTS cliente (
   id INT NOT NULL AUTO_INCREMENT,
   id_tipo_cliente int not null,   
   nombre VARCHAR(50) NULL,
   code VARCHAR(50) NULL,
   email VARCHAR(50) NULL,
   direccion VARCHAR(50) NULL,
   telefono VARCHAR(50) NULL,
   observaciones VARCHAR(2000) NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (id_tipo_cliente) REFERENCES tipo_cliente (id)
  );







DELIMITER //
CREATE FUNCTION saveclient(vid INT,vTypeClient INT, vName varchar(50), 
                           vCode varchar(50), vEmail varchar(50), 
                           vAddress varchar(50), vPhonenumber varchar(50), 
                           vDescription varchar(2000)
                           ) RETURNS INT( 1 )
COMMENT  'Funcion que almacena un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select code from cliente where code=vCode)
		THEN
			insert into cliente(id_tipo_cliente,nombre,
                                           code,email,direccion,telefono, 
                                           observaciones) 
                               values(vTypeClient,vName,vCode,vEmail, 
                                      vAddress,vPhonenumber,vDescription);
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;






DELIMITER //
CREATE PROCEDURE listclient(iduser int)
COMMENT 'Procedimiento que calcula y lista los clientes'
BEGIN
        select cli.id, tip.nombre as 'Tipo', cli.nombre,cli.code as 'Codigo',
               cli.email,cli.direccion,cli.telefono,cli.observaciones
        from cliente as cli
        inner join tipo_cliente as tip on cli.id_tipo_cliente = tip.id
        order by tip.nombre;
END//
DELIMITER ;







DELIMITER //
CREATE PROCEDURE searchclient(idclient int)
COMMENT 'Procedimiento que carga la informacion de una entrada de cerveza'
BEGIN
 
	
	select id,id_tipo_cliente,nombre,code,email,direccion,
               telefono,observaciones
	from cliente
	where id = idclient;
	
END//

DELIMITER ;








DELIMITER //
CREATE FUNCTION deleteclient(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un cliente'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
        delete from cliente where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updateclient(vid INT,vTypeClient INT, vName varchar(50), 
                           vCode varchar(50), vEmail varchar(50), 
                           vAddress varchar(50), vPhonenumber varchar(50), 
                           vDescription varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select id from cliente where code=vCode and id<>vid)
		THEN
			update cliente set 
                                id_tipo_cliente=vTypeClient,
                                nombre=vName,
                                code=vCode,
                                email=vEmail,
                                direccion=vAddress,
                                telefono=vPhonenumber, 
                                observaciones=vDescription    
                        where id = vid;		
			set res=1;														
		END IF;
	RETURN res;	
END//
DELIMITER ;







CREATE TABLE IF NOT EXISTS gasto (
   id INT NOT NULL AUTO_INCREMENT,
   id_tipo_gasto int not null,   
   observaciones VARCHAR(2000) NULL,
   valor DOUBLE,
   fecha DATE,   
   PRIMARY KEY (id),
   FOREIGN KEY (id_tipo_gasto) REFERENCES tipo_gasto (id)
  );






DELIMITER //
CREATE PROCEDURE loadexpensetype(idfilter int)
COMMENT 'Procedimiento que lista los tipos de cerveza'
BEGIN 
	IF idfilter > -1 THEN	
		select id,nombre
		from tipo_gasto
		ORDER BY nombre;		
        ELSE		
		select id,nombre
		from tipo_gasto
		ORDER BY nombre;	
   END IF;
END//
DELIMITER ;



 
DELIMITER //
CREATE FUNCTION saveexpense(vid INT,vTypeexpense INT,
                            vDescription varchar(2000), vValue DOUBLE,
                            vDateExpense date                           
                           ) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un gasto'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			insert into gasto(id_tipo_gasto,observaciones,
                                           valor,fecha) 
                               values(vTypeexpense,vDescription,vValue,
                                      vDateExpense);
			set res = 1;										
	RETURN res;	
END//
DELIMITER ;







DELIMITER //
CREATE PROCEDURE listexpense(idexpense int)
COMMENT 'Procedimiento que calcula y lista los gastos'
BEGIN
        select g.id,tip.nombre as 'Tipo de Gasto',g.observaciones,g.valor,g.fecha
        from gasto as g
        inner join tipo_gasto as tip on g.id_tipo_gasto = tip.id
        order by g.fecha;
END//
DELIMITER ;







DELIMITER //
CREATE PROCEDURE searchexpense(idexpense int)
COMMENT 'Procedimiento que carga la informacion de un gasto'
BEGIN 	
	select id,id_tipo_gasto,observaciones,valor,fecha
	from gasto
	where id = idexpense;
END//

DELIMITER ;










DELIMITER //
CREATE FUNCTION deleteexpense(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un gasto'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
        delete from gasto where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updateexpense(vid INT,vTypeexpense INT,
                            vDescription varchar(2000), vValue DOUBLE,
                            vDateExpense date ) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select id from gasto where id_tipo_gasto=vTypeexpense AND fecha = vDateExpense and id<>vid)
		THEN
			update  gasto set 
                                id_tipo_gasto=vTypeexpense,
                                observaciones=vDescription,
                                valor=vValue,
                                fecha=vDateExpense
                        where id = vid;		
			set res=1;														
		END IF;
	RETURN res;	
END//
DELIMITER ;






/***********************************************************/


alter table cliente add column password varchar(32);




DELIMITER //
CREATE FUNCTION saveclientregister(vid INT,vTypeClient INT, vName varchar(50), 
                           vCode varchar(50), vEmail varchar(50), 
                           vAddress varchar(50), vPhonenumber varchar(50), 
                           vPassword varchar(32)
                           ) RETURNS INT( 1 )
COMMENT  'Funcion que almacena un cliente, que solicito registro'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select code from cliente where code=vCode)
		THEN
			insert into cliente(id_tipo_cliente,nombre,
                                           code,email,direccion,telefono, 
                                           password,observaciones) 
                               values(vTypeClient,vName,vCode,vEmail, 
                                      vAddress,vPhonenumber,vPassword,'Se registro por la pagina');
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;







DROP PROCEDURE IF EXISTS loginpublic;
DELIMITER //
CREATE PROCEDURE loginpublic(usu VARCHAR(50), pass VARCHAR(32))
COMMENT 'Procedimiento que valida las credenciales de un usuario que de identifica en la pagina web'
BEGIN
   select id,nombre,email,direccion from cliente where password=pass and code=usu;		
END//

DELIMITER ;






DELIMITER //
CREATE PROCEDURE loadbeertypestock(idfilter int)
COMMENT 'Procedimiento que lista los tipos de cerveza'
BEGIN 
	IF idfilter > -1 THEN	
		select tip.id as id, tip.nombre as 'nombre', SUM(ent.cantidad) as 'stock'
                from entrada_cerveza as ent
                inner join tipo_cerveza as tip on ent.id_tipo_cerveva = tip.id
                group by tip.nombre
                order by tip.nombre;
        ELSE		
		select tip.id as id, tip.nombre as 'nombre', SUM(ent.cantidad) as 'stock'
                from entrada_cerveza as ent
                inner join tipo_cerveza as tip on ent.id_tipo_cerveva = tip.id
                group by tip.nombre
                order by tip.nombre;
   END IF;
END//
DELIMITER ;



CREATE TABLE pedido (
  id INT NOT NULL AUTO_INCREMENT,  
  idcliente INT not null,
  fechapedido DATE,
  direccion varchar(50),
  PRIMARY KEY (id),
  FOREIGN KEY (idcliente) references cliente(id)
) ENGINE = MyISAM;


CREATE TABLE pedidoproducto(
  id INT NOT NULL AUTO_INCREMENT,
  idpedido int,
  idcerveza INT,
  cantidad INT,
  PRIMARY KEY (id),
  FOREIGN KEY (idpedido) references pedido(id),
  FOREIGN KEY (idcerveza) references tipo_cerveza(id)
) ENGINE = MyISAM;

  

DELIMITER //
CREATE FUNCTION  saveorder (vidcliente integer, vdireccion varchar(50), vproducts varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un pedido de cervezas'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    /*Variable que contendra el tipo de cerveza a almacenar*/
    DECLARE vidcerveza varchar(50) DEFAULT '';    
    /*Variable que contendra la cantidad de cerveza pedida*/
    DECLARE vcantidad varchar(50) DEFAULT '';

    INSERT INTO pedido(idcliente,fechapedido,direccion, pedido) values (vidcliente, NOW(),vdireccion,0);
	
	SET @vidpedido = LAST_INSERT_ID();	
    
    WHILE (LOCATE(',', vproducts) > 0) DO

        /*Se saca el primer campo separado por coma del varchar*/
    	SET vidcerveza = ELT(1, vproducts);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vproducts = SUBSTRING(vproducts, LOCATE(',',vproducts) + 1);


        /*Se saca el primer campo separado por coma del varchar*/
    	SET vcantidad = ELT(1, vproducts);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vproducts = SUBSTRING(vproducts, LOCATE(',',vproducts) + 1);


        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
		IF vidcerveza <> ',' THEN	
    		INSERT INTO pedidoproducto(idpedido, idcerveza,cantidad) VALUES (@vidpedido, vidcerveza,vcantidad);
		END IF;
    END WHILE;

    SET res = 1;

    RETURN res;	
END//

DELIMITER ;




DROP PROCEDURE IF EXISTS loginpublic;
DELIMITER //
CREATE PROCEDURE loginpublic(usu VARCHAR(50), pass VARCHAR(32))
COMMENT 'Procedimiento que valida las credenciales de un usuario que de identifica en la pagina web'
BEGIN
   select id,nombre,email,direccion from cliente where password=pass and code=usu;		
END//

DELIMITER ;





/***********************************************************************************/


CREATE TABLE IF NOT EXISTS department (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`));





DELIMITER //
CREATE FUNCTION savedepartment(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un departamento'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from department where nombre=nom)
		THEN
			insert into department(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;






DELIMITER //
CREATE PROCEDURE searchdepartment(iddepartment int)
COMMENT 'Procedimiento que carga la informacion de un departamento'
BEGIN 	
	select id,nombre,descripcion
	from department
	where id = iddepartment;	
END//

DELIMITER ;




DELIMITER //
CREATE FUNCTION deletedepartment(cod INT) RETURNS INT(1)
COMMENT 'Funcion que elimina un departamento'
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE res INT default 0;	
    delete from department where id = cod;
	SET res = 1;
	RETURN res;
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION updatedepartment(cod INT,nom varchar(50),des varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un departamento'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from department where nombre=nom and id<>cod)
		THEN
			update department set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE listdepartment(iduser int)
COMMENT 'Procedimiento que lista los departamento'
BEGIN
   select id,nombre as nombre_departamento,descripcion 
   from department
   order by nombre;
END//

DELIMITER ;




CREATE TABLE IF NOT EXISTS ciudad (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NULL,
  descripcion VARCHAR(2000) NULL,
  iddepartment INT,
  PRIMARY KEY (id),
  foreign key (iddepartment) references department(id)
);









DELIMITER //
CREATE FUNCTION savecity(id int, vname varchar(50), vdepartment int, vdescription varchar(50)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un departamento'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from ciudad where nombre=vname)
		THEN
			insert into ciudad(nombre,iddepartment,descripcion)
			VALUES (vname,vdepartment,vdescription);
			set res = 1;										
		END IF;

	RETURN res;
	
	

END//

DELIMITER ;









DELIMITER //
CREATE FUNCTION updatecity(vid int, vname varchar(50), vdepartment int, vdescription varchar(50)) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un municipio'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from ciudad where nombre=vname and id<>vid)
		THEN

UPDATE ciudad
   SET  nombre=vname, iddepartment=vdepartment, descripcion=vdescription
 WHERE id=vid;
		
		set res=1;
								
			
		END IF;

	RETURN res;
	

END//

DELIMITER ;






DELIMITER //
CREATE PROCEDURE searchcity(vid int)
COMMENT 'Procedimiento que carga la informacion de un municipio'
BEGIN
 	
	SELECT id, nombre, iddepartment, descripcion
	FROM ciudad
	where id = vid;	
	
END//

DELIMITER ;







DELIMITER //
CREATE FUNCTION deletecity(vid INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que elimina un municipio'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM ciudad WHERE id = vid;
SET res = 1;
	RETURN res;
END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE listcity(iduser int)
COMMENT 'Procedimiento que lista los municipios'
BEGIN
   
	SELECT ci.id, ci.nombre as nombre_ciudad,
               dep.nombre as departamento, ci.descripcion as descripcion
	FROM ciudad as ci
	INNER JOIN department as dep on ci.iddepartment = dep.id
	ORDER BY ci.nombre;

END//

DELIMITER ;





DELIMITER //
CREATE PROCEDURE loaddepartment(idfilter int)
COMMENT 'Procedimiento que lista los departamentos'
BEGIN
 
	IF idfilter > -1 THEN
	
		select id,nombre
		from department
		ORDER BY nombre;
		
   ELSE	
	
		select id,nombre
		from department
		ORDER BY nombre;
	
   END IF;

END//

DELIMITER ;




DELIMITER //
CREATE PROCEDURE loadcity(idfilter int)
COMMENT 'Procedimiento que lista los municipios'
BEGIN
 
	IF idfilter > -1 THEN
	
		select id,nombre
		from ciudad
                where iddepartment = idfilter
		ORDER BY nombre;
		
   ELSE	
	
		select id,nombre
		from ciudad
		ORDER BY nombre;
	
   END IF;

END//

DELIMITER ;




alter table pedido add column idciudad int;

alter table pedido add foreign key (idciudad) references ciudad(id);


DROP FUNCTION IF EXISTS saveorder;


  DELIMITER //
CREATE  FUNCTION  saveorder (vidcliente integer, vdireccion varchar(50), vidciudad integer, vproducts varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un pedido de cervezas'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    /*Variable que contendra el tipo de cerveza a almacenar*/
    DECLARE vidcerveza varchar(50) DEFAULT '';    
    /*Variable que contendra la cantidad de cerveza pedida*/
    DECLARE vcantidad varchar(50) DEFAULT '';

    INSERT INTO pedido(idcliente,fechapedido,direccion,idciudad,estado) values (vidcliente, NOW(),vdireccion,vidciudad,0);
	
	SET @vidpedido = LAST_INSERT_ID();	
    
    WHILE (LOCATE(',', vproducts) > 0) DO

        /*Se saca el primer campo separado por coma del varchar*/
    	SET vidcerveza = ELT(1, vproducts);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vproducts = SUBSTRING(vproducts, LOCATE(',',vproducts) + 1);


        /*Se saca el primer campo separado por coma del varchar*/
    	SET vcantidad = ELT(1, vproducts);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vproducts = SUBSTRING(vproducts, LOCATE(',',vproducts) + 1);


        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
		IF vidcerveza <> ',' THEN	
    		INSERT INTO pedidoproducto(idpedido, idcerveza,cantidad) VALUES (@vidpedido, vidcerveza,vcantidad);
		END IF;
    END WHILE;

    SET res = 1;

    RETURN res;	
END//

DELIMITER ;





DROP PROCEDURE IF EXISTS login;
DELIMITER //
CREATE PROCEDURE login(usu VARCHAR(50), pass VARCHAR(50))
COMMENT 'Procedimiento que valida las credenciales de un usuairo'
BEGIN
   select usuario,primer_nombre,primer_apellido,rol,id from usuario where password=pass and usuario=usu;		
END//

DELIMITER ;







DELIMITER //
CREATE PROCEDURE validateclient(idfilter int)
COMMENT 'Procedimiento que valida si existe un cliente'
BEGIN 		
		select id,code, nombre, direccion
		from cliente
                where code = idfilter;	
	   
END//

DELIMITER ;










DELIMITER //
CREATE PROCEDURE listorder(iduser int)
COMMENT 'Procedimiento que lista los pedidos'
BEGIN
   select p.id, p.fechapedido as fecha, c.nombre as ciudad, p.direccion as direccion, cli.nombre as cliente, 
          CASE estado 
             WHEN 1 THEN 'Cerrado' 
 	     ELSE 'Abierto' END as estado
   from pedido as p inner join ciudad as c on c.id = p.idciudad
   inner join cliente as cli on cli.id = p.idcliente 
   order by p.fechapedido desc;
END//

DELIMITER ;








DELIMITER //
CREATE PROCEDURE searchorderproduct(vid int)
COMMENT 'Procedimiento que carga productos y sus cantidades de un determinada pedido'
BEGIN
 	
	SELECT ped.id,tip.nombre,ped.cantidad
	FROM pedidoproducto as ped 
        inner join tipo_cerveza as tip on ped.idcerveza = tip.id
	where ped.idpedido = vid;	
	
END//

DELIMITER ;






DELIMITER //
CREATE FUNCTION deleteorder(vid INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que elimina un pedido y los productos asociados a este'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    
    DECLARE res INT DEFAULT 0;
    DECLARE vestado bit;
    SET vestado = (select estado from pedido where id = vid);

    if vestado <> 1 THEN	
    	DELETE FROM pedidoproducto WHERE idpedido = vid;
        DELETE FROM pedido WHERE id = vid;
        SET res = 1;
    END IF;
    
    RETURN res;

END//

DELIMITER ;






DELIMITER //
CREATE PROCEDURE searchorder(vid int)
COMMENT 'Procedimiento que carga productos y sus cantidades de un determinada pedido'
BEGIN
 	
	SELECT id,idcliente,fechapedido, direccion, idciudad,estado
	FROM pedido 
	where id = vid;	
	
END//

DELIMITER ;





alter table pedido add column estado bit;




 






DELIMITER //
CREATE FUNCTION orderupdatestate(vid int,  vestado int) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica el estado de una orden'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    

    UPDATE pedido
    SET  estado=vestado
    WHERE id=vid;
		
    set res=1;
								
    RETURN res;
	

END//

DELIMITER ;




DROP FUNCTION IF EXISTS listbeerinventary;


    DELIMITER //
    CREATE PROCEDURE listbeerinventary(iduser int)
    COMMENT 'Procedimiento que calcula y lista el total de cervezas disponibles'
    BEGIN
            select id,tipo, SUM(res.cantidad) from(
            select id,tipo,cantidad from vbeerin
            union all
            select id,tipo,cantidad from vbeerout) as res
            group by res.tipo
            order by res.tipo;
    END//
    DELIMITER ;



    
CREATE VIEW vbeerin
 AS 
select tip.id, tip.nombre as 'tipo', SUM(ent.cantidad) as cantidad
        from entrada_cerveza as ent
        inner join tipo_cerveza as tip on ent.id_tipo_cerveva = tip.id        
        group by tip.nombre
        order by tip.nombre;



CREATE VIEW vbeerout
 AS 
    select tip.id, tip.nombre as 'tipo', -SUM(sal.cantidad) as cantidad
        from pedidoproducto as sal
        inner join tipo_cerveza as tip on sal.idcerveza = tip.id
        group by tip.nombre
        order by tip.nombre;









DELIMITER //
CREATE PROCEDURE loadbeertypestock(idfilter int)
COMMENT 'Procedimiento que lista los tipos de cerveza con sus cantidades disponibles'
BEGIN 
	IF idfilter > -1 THEN	
		select id,tipo as nombre, SUM(res.cantidad) as stock from(
                select id,tipo,cantidad from vbeerin
                union all
                select id,tipo,cantidad from vbeerout) as res
                group by res.tipo
                order by res.tipo;
        ELSE		
                select id,tipo as nombre, SUM(res.cantidad) as stock from(
                select id,tipo,cantidad from vbeerin
                union all
                select id,tipo,cantidad from vbeerout) as res
                group by res.tipo
                order by res.tipo;
   END IF;
END//
DELIMITER ;


/*************************************************************************/
/*************************************************************************/
/*************************************************************************/


alter table pedido add column descripcion varchar(2000);





DROP FUNCTION IF EXISTS saveorder;


DELIMITER //
CREATE  FUNCTION  saveorder (vidcliente integer, vdireccion varchar(50), vidciudad integer,vdescripcion varchar(2000), vproducts varchar(2000)) RETURNS INT( 1 ) 
COMMENT  'Funcion que almacena un pedido de cervezas'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    /*Variable que contendra el tipo de cerveza a almacenar*/
    DECLARE vidcerveza varchar(50) DEFAULT '';    
    /*Variable que contendra la cantidad de cerveza pedida*/
    DECLARE vcantidad varchar(50) DEFAULT '';

    INSERT INTO pedido(idcliente,fechapedido,direccion,idciudad,estado,descripcion) values (vidcliente, NOW(),vdireccion,vidciudad,0,vdescripcion);
	
	SET @vidpedido = LAST_INSERT_ID();	
    
    WHILE (LOCATE(',', vproducts) > 0) DO

        /*Se saca el primer campo separado por coma del varchar*/
    	SET vidcerveza = ELT(1, vproducts);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vproducts = SUBSTRING(vproducts, LOCATE(',',vproducts) + 1);


        /*Se saca el primer campo separado por coma del varchar*/
    	SET vcantidad = ELT(1, vproducts);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vproducts = SUBSTRING(vproducts, LOCATE(',',vproducts) + 1);


        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
		IF vidcerveza <> ',' THEN	
    		INSERT INTO pedidoproducto(idpedido, idcerveza,cantidad) VALUES (@vidpedido, vidcerveza,vcantidad);
		END IF;
    END WHILE;

    SET res = 1;

    RETURN res;	
END//

DELIMITER ;




DROP FUNCTION IF EXISTS listorder;


DELIMITER //
CREATE PROCEDURE listorder(iduser int)
COMMENT 'Procedimiento que lista los pedidos'
BEGIN
   select p.id, p.fechapedido as fecha, c.nombre as ciudad, p.direccion as direccion, cli.nombre as cliente, 
          CASE estado 
             WHEN 1 THEN 'Cerrado' 
 	     ELSE 'Abierto' END as estado, p.descripcion as observaciones
   from pedido as p inner join ciudad as c on c.id = p.idciudad
   inner join cliente as cli on cli.id = p.idcliente 
   order by p.fechapedido desc;
END//

DELIMITER ;




DROP FUNCTION IF EXISTS searchorder;


DELIMITER //
CREATE PROCEDURE searchorder(vid int)
COMMENT 'Procedimiento que carga productos y sus cantidades de un determinada pedido'
BEGIN
 	
	SELECT id,idcliente,fechapedido, direccion, idciudad,estado, descripcion
	FROM pedido 
	where id = vid;	
	
END//

DELIMITER ;