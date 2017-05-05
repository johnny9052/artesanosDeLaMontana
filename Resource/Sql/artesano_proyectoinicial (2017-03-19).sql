-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2017 at 11:14 PM
-- Server version: 10.0.30-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `artesano_proyectoinicial`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listbeerin`(iduser int)
    COMMENT 'Procedimiento que lista las entradas de cerveza'
BEGIN
   select cerv.id, tip.nombre as 'tipo cerveza',cerv.cantidad,
          cerv.presentacion,cerv.lote,cerv.fecha_fabricacion,
          cerv.fecha_gasificacion,cerv.observaciones
   from entrada_cerveza cerv
   join tipo_cerveza as tip on cerv.id_tipo_cerveva = tip.id  
   order by nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listbeerinventary`(iduser int)
    COMMENT 'Procedimiento que calcula y lista el total de cervezas disponibles'
BEGIN
            select id,tipo, SUM(res.cantidad) from(
            select id,tipo,cantidad from vbeerin
            union all
            select id,tipo,cantidad from vbeerout) as res
            group by res.tipo
            order by res.tipo;
    END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listbeerproduct`(iduser int)
    COMMENT 'Procedimiento que lista los tipos de cerveza '
BEGIN
   select tip.id,tip.nombre,tip.descripcion, tip.alcohol as 'alcohol (%)', 
          am.nombre  as 'amargor', tip.valor as 'valor $', tip.cantidad as 'cantidad (ml)'
   from tipo_cerveza as tip
   inner join amargor as am on am.id = tip.amargor
   order by tip.nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listbitter`(iduser int)
    COMMENT 'Procedimiento que lista los niveles de amargor'
BEGIN
   select id,nombre as 'nombre amargor',descripcion 
   from amargor
   order by nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listcity`(iduser int)
    COMMENT 'Procedimiento que lista los municipios'
BEGIN
   
	SELECT ci.id, ci.nombre as nombre_ciudad,
               dep.nombre as departamento, ci.descripcion as descripcion
	FROM ciudad as ci
	INNER JOIN department as dep on ci.iddepartment = dep.id
	ORDER BY ci.nombre;

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listclient`(iduser int)
    COMMENT 'Procedimiento que calcula y lista los clientes'
BEGIN
        select cli.id, tip.nombre as 'Tipo', cli.nombre,cli.code as 'Codigo',
               cli.email,cli.direccion,cli.telefono,cli.observaciones
        from cliente as cli
        inner join tipo_cliente as tip on cli.id_tipo_cliente = tip.id
        order by tip.nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listdepartment`(iduser int)
    COMMENT 'Procedimiento que lista los departamento'
BEGIN
   select id,nombre as nombre_departamento,descripcion 
   from department
   order by nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listexpense`(idexpense int)
    COMMENT 'Procedimiento que calcula y lista los gastos'
BEGIN
        select g.id,tip.nombre as 'Tipo de Gasto',g.observaciones,g.valor,g.fecha
        from gasto as g
        inner join tipo_gasto as tip on g.id_tipo_gasto = tip.id
        order by g.fecha;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listinventary`(iduser int)
    COMMENT 'Procedimiento que lista los inventarios '
BEGIN
   select inv.id,inv.nombre,tip.nombre as 'tipo', inv.codigo, 
          inv.fecha_adquisicion as 'fecha entrada', 
          inv.costo as '$ valor'
   from inventario as inv
   inner join tipo_inventario as tip on tip.id = inv.id_tipo
   order by inv.codigo;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listinventarytype`(iduser int)
    COMMENT 'Procedimiento que lista los niveles de tipo_inventario'
BEGIN
   select id,nombre as 'nombre tipo_inventario',descripcion 
   from tipo_inventario
   order by nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listmessage`(iduser int)
    COMMENT 'Procedimiento que lista los mensajes'
BEGIN
   
	SELECT id, nombre as nombre_solicitante, descripcion, respuesta,CASE estado 
             WHEN 1 THEN 'Cerrado' 
 	     ELSE 'Abierto' END as estado
	FROM mensaje;
	

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listorder`(iduser int)
    COMMENT 'Procedimiento que lista los pedidos'
BEGIN
   select p.id, p.fechapedido as fecha, c.nombre as ciudad, p.direccion as direccion, cli.nombre as cliente, 
          CASE estado 
             WHEN 1 THEN 'Cerrado' 
 	     ELSE 'Abierto' END as estado, p.descripcion as observaciones
   from pedido as p inner join ciudad as c on c.id = p.idciudad
   inner join cliente as cli on cli.id = p.idcliente 
   order by p.fechapedido desc;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listrol`(iduser int)
    COMMENT 'Procedimiento que lista los roles de un determinado usuario'
BEGIN
   select id,nombre as nombre_rol,descripcion 
   from rol
   order by nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listspendtype`(iduser int)
    COMMENT 'Procedimiento que lista los niveles de tipo_gasto'
BEGIN
   select id,nombre as 'nombre tipo_gasto',descripcion 
   from tipo_gasto
   order by nombre;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listuser`(iduser int)
    COMMENT 'Procedimiento que lista los usuarios'
BEGIN
   
	SELECT us.id, us.primer_nombre as primer_nombre, us.primer_apellido as primer_apellido, us.usuario as nickname, r.nombre as rol, 
	       us.descripcion as descripcion
	FROM usuario as us
	INNER JOIN rol as r on r.id = us.rol
	ORDER BY us.primer_nombre;

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadallmenu`()
    COMMENT 'Procedimiento que lista todos los menus del sistema'
BEGIN
   
	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,m.prioridad
	from menu as m
	left JOIN menu as m2 on m.padre = m2.id	
	order by m.prioridad;

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadamargor`(idfilter int)
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

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadapage`(IN `vpage` VARCHAR(2000), IN `vrol` INT)
    COMMENT 'Procedimiento que lista los menus'
BEGIN
   
	select m.codigo
	from menu as m 	
	inner join menu_rol as mr on mr.idmenu = m.id
	where mr.idrol = vrol AND m.codigo = vpage;	

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadbeertype`(idfilter int)
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
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadbeertypestock`(idfilter int)
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
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadcity`(idfilter int)
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

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadclienttype`(idfilter int)
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
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loaddepartment`(idfilter int)
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

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadexpensetype`(idfilter int)
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
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadmenu`(IN `rol` INT)
    COMMENT 'Procedimiento que lista los menus de un determinado rol'
BEGIN
   
	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,mr.idrol,m.prioridad
	from menu as m
	left JOIN menu as m2 on m.padre = m2.id
	LEFT join menu_rol as mr on mr.idmenu = m.id
	where (mr.idrol = rol OR (m.padre = -1 AND (mr.idrol = rol OR mr.idrol IS NULL)))
	order by m.prioridad;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadrol`(IN `idfilter` INT)
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

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loadtypeinventary`(idfilter int)
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

END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `login`(usu VARCHAR(50), pass VARCHAR(50))
    COMMENT 'Procedimiento que valida las credenciales de un usuairo'
BEGIN
   select usuario,primer_nombre,primer_apellido,rol,id from usuario where password=pass and usuario=usu;		
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `loginpublic`(usu VARCHAR(50), pass VARCHAR(32))
    COMMENT 'Procedimiento que valida las credenciales de un usuario que de identifica en la pagina web'
BEGIN
   select id,nombre,email,direccion from cliente where password=pass and code=usu;		
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchbeerin`(idbeerin int)
    COMMENT 'Procedimiento que carga la informacion de una entrada de cerveza'
BEGIN
 
	
	select id,id_tipo_cerveva,cantidad,presentacion,lote,fecha_fabricacion, 
               fecha_gasificacion,observaciones
	from entrada_cerveza
	where id = idbeerin;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchbeerproduct`(idbeerproduct int)
    COMMENT 'Procedimiento que carga la informacion de un tipo de cerveza'
BEGIN
 
	
	select  id,nombre,descripcion,alcohol,amargor,valor,cantidad
	from tipo_cerveza
	where id = idbeerproduct;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchbitter`(idbitter int)
    COMMENT 'Procedimiento que carga la informacion de un rol'
BEGIN
 
	
	select id,nombre,descripcion
	from amargor
	where id = idbitter;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchcity`(vid int)
    COMMENT 'Procedimiento que carga la informacion de un municipio'
BEGIN
 	
	SELECT id, nombre, iddepartment, descripcion
	FROM ciudad
	where id = vid;	
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchclient`(idclient int)
    COMMENT 'Procedimiento que carga la informacion de una entrada de cerveza'
BEGIN
 
	
	select id,id_tipo_cliente,nombre,code,email,direccion,
               telefono,observaciones
	from cliente
	where id = idclient;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchdepartment`(iddepartment int)
    COMMENT 'Procedimiento que carga la informacion de un departamento'
BEGIN 	
	select id,nombre,descripcion
	from department
	where id = iddepartment;	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchexpense`(idexpense int)
    COMMENT 'Procedimiento que carga la informacion de un gasto'
BEGIN 	
	select id,id_tipo_gasto,observaciones,valor,fecha
	from gasto
	where id = idexpense;
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchinventary`(idinventary int)
    COMMENT 'Procedimiento que carga la informacion de un inventario'
BEGIN 
	select  id,id_tipo,nombre, codigo,fecha_adquisicion,costo
	from inventario
	where id = idinventary;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchinventarytype`(idinventarytype int)
    COMMENT 'Procedimiento que carga la informacion de un rol'
BEGIN
 
	
	select id,nombre,descripcion
	from tipo_inventario
	where id = idinventarytype;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchmessage`(vid int)
    COMMENT 'Procedimiento que carga la informacion de un mensaje'
BEGIN
 	
	SELECT id, nombre, email, descripcion,respuesta, estado
	FROM mensaje
	where id = vid;	
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchorder`(vid int)
    COMMENT 'Procedimiento que carga productos y sus cantidades de un determinada pedido'
BEGIN
 	
	SELECT id,idcliente,fechapedido, direccion, idciudad,estado, descripcion
	FROM pedido 
	where id = vid;	
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchorderproduct`(vid int)
    COMMENT 'Procedimiento que carga productos y sus cantidades de un determinada pedido'
BEGIN
 	
	SELECT ped.id,tip.nombre,ped.cantidad
	FROM pedidoproducto as ped 
        inner join tipo_cerveza as tip on ped.idcerveza = tip.id
	where ped.idpedido = vid;	
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchrol`(idrol int)
    COMMENT 'Procedimiento que carga la informacion de un rol'
BEGIN
 
	
	select id,nombre,descripcion
	from rol
	where id = idrol;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchspendtype`(idspendtype int)
    COMMENT 'Procedimiento que carga la informacion de un tipo_gasto'
BEGIN
 
	
	select id,nombre,descripcion
	from tipo_gasto
	where id = idspendtype;
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchuser`(vid int)
    COMMENT 'Procedimiento que carga la informacion de un usuario'
BEGIN
 	
	SELECT id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
	usuario, rol, descripcion
	FROM usuario
	where id = vid;	
	
END$$

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `validateclient`(idfilter int)
    COMMENT 'Procedimiento que valida si existe un cliente'
BEGIN 		
		select id,code, nombre, direccion
		from cliente
                where code = idfilter;	
	   
END$$

--
-- Functions
--
CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletebeerin`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una entrada de una cerveza'
BEGIN
	DECLARE res INT default 0;	
        delete from entrada_cerveza where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletebeerproduct`(vid INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un tipo de cerveza'
BEGIN
	DECLARE res INT default 0;	
        delete from tipo_cerveza where id = vid;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletebitter`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un nivel de amargor'
BEGIN
	DECLARE res INT default 0;	
    delete from amargor where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletecity`(vid INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un municipio'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM ciudad WHERE id = vid;
SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleteclient`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un cliente'
BEGIN
	DECLARE res INT default 0;	
        delete from cliente where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletedepartment`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un departamento'
BEGIN
	DECLARE res INT default 0;	
    delete from department where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleteexpense`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un gasto'
BEGIN
	DECLARE res INT default 0;	
        delete from gasto where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleteinventary`(vid INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un inventario'
BEGIN
	DECLARE res INT default 0;	
        delete from inventario where id = vid;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleteinventarytype`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un nivel de tipo_inventario'
BEGIN
	DECLARE res INT default 0;	
    delete from tipo_inventario where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletemessage`(vid INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un mensaje'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM mensaje WHERE id = vid;
SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleteorder`(vid INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un pedido y los productos asociados a este'
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

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleterol`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un rol'
BEGIN
	DECLARE res INT default 0;	
    delete from rol where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deletespendtype`(cod INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un nivel de tipo_gasto'
BEGIN
	DECLARE res INT default 0;	
    delete from tipo_gasto where id = cod;
	SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `deleteuser`(vid INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un usuario'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM usuario WHERE id = vid;
SET res = 1;
	RETURN res;
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `orderupdatestate`(`vid` INT, `vestado` BIT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica el estado de una orden'
BEGIN 
    DECLARE res INT DEFAULT 0;
    

    UPDATE pedido
    SET  estado=vestado
    WHERE id=vid;
		
    set res=1;
								
    RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savebeerin`(vid INT,vBeerType INT, vBootle INT, 
                           vPresentation varchar(50), vLote varchar(50), 
                           vDateMosto date, vDateGasificacion date, 
                           vDescription varchar(2000)
                           ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena una entrada de cerveza'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savebeerproduct`(id int, vname varchar(50), vdescription varchar(2000),valcohol double, vamargor int,
                                    vvalor double, vcantidad double) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena tipo de cerveza'
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
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savebitter`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un nivel de amargor'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from amargor where nombre=nom)
		THEN
			insert into amargor(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savecity`(id int, vname varchar(50), vdepartment int, vdescription varchar(50)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un departamento'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from ciudad where nombre=vname)
		THEN
			insert into ciudad(nombre,iddepartment,descripcion)
			VALUES (vname,vdepartment,vdescription);
			set res = 1;										
		END IF;

	RETURN res;
	
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveclient`(vid INT,vTypeClient INT, vName varchar(50), 
                           vCode varchar(50), vEmail varchar(50), 
                           vAddress varchar(50), vPhonenumber varchar(50), 
                           vDescription varchar(2000)
                           ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveclientregister`(vid INT,vTypeClient INT, vName varchar(50), 
                           vCode varchar(50), vEmail varchar(50), 
                           vAddress varchar(50), vPhonenumber varchar(50), 
                           vPassword varchar(32)
                           ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente, que solicito registro'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savedepartment`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un departamento'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from department where nombre=nom)
		THEN
			insert into department(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveexpense`(`vid` INT, `vTypeexpense` INT, `vDescription` VARCHAR(2000), `vValue` DOUBLE, `vDateExpense` DATE) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un gasto'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			insert into gasto(id_tipo_gasto,observaciones,
                                           valor,fecha) 
                               values(vTypeexpense,vDescription,vValue,
                                      vDateExpense);
			set res = 1;										
	RETURN res;	
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveinventary`(vid int, vname varchar(50), vcode varchar(50),vdate date,
                                    vvalor double, vtype int) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena inventarios'
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
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveinventarytype`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un nivel de tipo_inventario'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_inventario where nombre=nom)
		THEN
			insert into tipo_inventario(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveorder`(vidcliente integer, vdireccion varchar(50), vidciudad integer,vdescripcion varchar(2000), vproducts varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un pedido de cervezas'
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
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savepublicmessage`(nom varchar(50),email varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un mensaje enviado por un cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
    insert into mensaje(nombre,email,descripcion,estado) values(nom,email,des,0);	
    set res = 1;								
    RETURN res;	
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saverol`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un rol'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from rol where nombre=nom)
		THEN
			insert into rol(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `savespendtype`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un nivel de tipo_gasto'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_gasto where nombre=nom)
		THEN
			insert into tipo_gasto(nombre,descripcion) values(nom,des);	
			set res = 1;							
			
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveuser`(id int, vfirstname varchar(50), vsecondname varchar(50), vfirstlastname varchar(50), vsecondlastname varchar(50), vuser varchar(50), vpass varchar(50), vrol int, vdescription varchar(50)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un rol'
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
	
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatebeerin`(vid INT,vBeerType INT, vBootle INT, 
                           vPresentation varchar(50), vLote varchar(50), 
                           vDateMosto date, vDateGasificacion date, 
                           vDescription varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una entrada de una cerveza'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatebeerproduct`(vid int, vname varchar(50), vdescription varchar(2000),valcohol double, vamargor int,
                                    vvalor double, vcantidad double) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un tipo de cerveza'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatebitter`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un nivel de amargor'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from amargor where nombre=nom and id<>cod)
		THEN
			update amargor set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatecity`(vid int, vname varchar(50), vdepartment int, vdescription varchar(50)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un municipio'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updateclient`(vid INT,vTypeClient INT, vName varchar(50), 
                           vCode varchar(50), vEmail varchar(50), 
                           vAddress varchar(50), vPhonenumber varchar(50), 
                           vDescription varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un cliente'
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
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatedepartment`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un departamento'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from department where nombre=nom and id<>cod)
		THEN
			update department set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updateexpense`(vid INT,vTypeexpense INT,
                            vDescription varchar(2000), vValue DOUBLE,
                            vDateExpense date ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un cliente'
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
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updateinventary`(vid int, vname varchar(50), vcode varchar(50),vdate date,
                                    vvalor double, vtype int) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un inventario'
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
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updateinventarytype`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un nivel de tipo_inventario'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_inventario where nombre=nom and id<>cod)
		THEN
			update tipo_inventario set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatemessage`(cod INT,resp varchar(2000),est INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que actualiza el estado de un mensaje de un usuario'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
    update mensaje set respuesta = resp, estado = est where id = cod;		
    set res=1;
												
    RETURN res;
	
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatepermission`(vid integer, vpermission varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que actualiza los permisos de un rol'
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
END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updaterol`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un rol'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from rol where nombre=nom and id<>cod)
		THEN
			update rol set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updatespendtype`(cod INT,nom varchar(50),des varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un nivel de tipo_gasto'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select nombre from tipo_gasto where nombre=nom and id<>cod)
		THEN
			update tipo_gasto set nombre = nom,descripcion = des where id = cod;		
			set res=1;
														
		END IF;

	RETURN res;
	

END$$

CREATE DEFINER=`artesano`@`localhost` FUNCTION `updateuser`(vid int, vfirstname varchar(50), vsecondname varchar(50), vfirstlastname varchar(50), vsecondlastname varchar(50), vuser varchar(50), vpass varchar(50), vrol int, vdescription varchar(50)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un rol'
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
	

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `amargor`
--

CREATE TABLE IF NOT EXISTS `amargor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `amargor`
--

INSERT INTO `amargor` (`id`, `nombre`, `descripcion`) VALUES
(1, 'bajo', ''),
(2, 'medio', ''),
(3, 'alto', '');

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `iddepartment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iddepartment` (`iddepartment`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `descripcion`, `iddepartment`) VALUES
(1, 'Pereira', '', 1),
(2, 'Armenia', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_cliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `observaciones` varchar(2000) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_cliente` (`id_tipo_cliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `id_tipo_cliente`, `nombre`, `code`, `email`, `direccion`, `telefono`, `observaciones`, `password`) VALUES
(2, 2, 'Cliente de prueba', '123456789', 'prueba@prueba.com', 'direccion de prueba', '3217591569', 'Se registro por la pagina', '827ccb0eea8a706c4c34a16891f84e7b'),
(3, 2, 'David Alberto Angarita Garcia', '1094882984', 'davidangaritag@gmail.com', 'Calle 5 Norte # 18a-40 apt 303', '3002680564', 'Se registro por la pagina', '78fcbf06d16ee25e5721320cabadb47f'),
(4, 2, 'Nestor Ivan Marin', '18400171', 'nestorivanmarin@hotmail.com', 'Barrio La Huerta Mz D # 12', '3113305952', 'Se registro por la pagina', '5458ac2651502c439bd2d11b08e23914'),
(5, 2, 'Santiago', '1054994368', 'santiago-c193@hotmail.com', 'Calle 17 # 24-29', '3217816192', 'Se registro por la pagina', 'd36cb8683f94bed0e62c2809b6f1e93d'),
(6, 2, 'Carlos Mario', '1088293787', 'Cmtangarife@utp.edu.co', 'Parque industrial sector B', '3207529212', 'Se registro por la pagina', '0671a2e4122c2de7d728e672621b4cd3'),
(7, 2, 'JosÃ© Omar Espitia Delgado', '10000227', 'joseomar.espitia@gmail.com', 'Claro 17 No 4-58', '3136149041', 'Se registro por la pagina', '8f5910f5285189502721a2e9433d9b8b'),
(8, 2, 'santiago naranjo garcia', '1053829750', 'ogaitnas96@hotmail.com', 'Cr 22 # 24-54 Mz 1 Cs 22', '3208651452', 'Se registro por la pagina', '342693e14941bb23fbcec39b74cd396c'),
(9, 2, 'Ricardo Naranjo GarcÃ­a', '1088265663', 'ricardong0224@gmail.com', 'Calle17#4-58', '3216297766', 'Se registro por la pagina', '467f477100edbb62405d658c524d0beb'),
(10, 1, 'Sajon', '1088317558', 'sajonsandwich@gmail.com', 'CRA 13 #2e 04 la aurora bloque 9 apto 304', '3205926260', 'Se registro por la pagina', '4eff46fa812e5faaf05ceec035f251b0'),
(11, 2, 'Bearded Cold Brew', '1088296832', 'cesar_5611@hotmail.com', 'Loma linda dosquebradas', '3113613634', 'Se registro por la pagina', '482c811da5d5b4bc6d497ffa98491e38'),
(12, 2, 'Luisa Fernanda Espitia Delgado', '1088267780', 'lui32927@gmail.com', 'Calle 17#4-58', '3122950769', 'Se registro por la pagina', '5eafd292cdf7c550fe1fb055afb689b1'),
(13, 2, 'Sebastian Valencia', '1088306568', 'zvsebastian@gmail.com', 'Bulevar de las Villas m8 c 13', '3182813442', '', NULL),
(14, 1, 'JOSE OCHOA RESTEPO', '10024598', 'josefernandoochoa@yahoo.com', 'cll 11 # 12b - 20', '3176571333', 'Se registro por la pagina', '12ab23001915840b45eedb100e142ef2'),
(15, 2, 'Andres felipe muÃ±oz gil ', '1088335690', 'pipemz2013@gmail.com', 'Car5#18-33', '3147245874', 'Se registro por la pagina', '28ce07f4f2b4db9144b5509479e3db25'),
(16, 2, 'Mariano Gonzalez Pardo', '531152', 'nanete96@gmail.com', 'Vereda Partidas, Chinchina - Caldas', '3174835905', 'Se registro por la pagina', '93620bceaf8a78c61204a2050ef652ab'),
(17, 2, 'juan carlos castaÃ±o', '94458823', 'jucarlos9@hotmail.com', 'calle 22 # 18-08', '3103567485', 'Se registro por la pagina', '89f125d702a124d8353d1178d2a1177b');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Risaralda', ''),
(2, 'Quindio', '');

-- --------------------------------------------------------

--
-- Table structure for table `entrada_cerveza`
--

CREATE TABLE IF NOT EXISTS `entrada_cerveza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_cerveva` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `presentacion` varchar(50) DEFAULT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_gasificacion` date NOT NULL,
  `observaciones` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_cerveva` (`id_tipo_cerveva`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `entrada_cerveza`
--

INSERT INTO `entrada_cerveza` (`id`, `id_tipo_cerveva`, `cantidad`, `presentacion`, `lote`, `fecha_fabricacion`, `fecha_gasificacion`, `observaciones`) VALUES
(8, 4, 72, '330', '30007', '2017-01-03', '2017-01-17', ''),
(7, 2, 13, '330', '10004', '2016-12-02', '2016-12-16', ''),
(9, 2, 89, '330', '10005', '2017-01-13', '2017-01-30', ''),
(10, 3, 79, '330', '40005', '2017-01-23', '2017-02-06', ''),
(11, 1, 79, '330', '20005', '2017-02-03', '2017-03-20', '');

-- --------------------------------------------------------

--
-- Table structure for table `gasto`
--

CREATE TABLE IF NOT EXISTS `gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_gasto` int(11) NOT NULL,
  `observaciones` varchar(2000) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_gasto` (`id_tipo_gasto`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `gasto`
--

INSERT INTO `gasto` (`id`, `id_tipo_gasto`, `observaciones`, `valor`, `fecha`) VALUES
(2, 1, 'EnergÃ­a electrica', 100000, '2016-09-11'),
(3, 3, 'Materias primas para la fabricaciÃ³n de 4 lotes de cerveza', 448000, '2016-09-15'),
(4, 3, 'Cardamomo y guayaba manzana, la 14 pereira', 16320, '2016-09-24'),
(5, 3, 'Pago envÃ­o desde medellin', 82000, '2016-09-17'),
(6, 1, 'EnergÃ­a', 100000, '2016-10-15'),
(7, 2, 'Hielo', 25000, '2016-10-08'),
(8, 2, 'Hielo', 25000, '2016-10-01'),
(9, 2, 'Hielo', 25000, '2016-09-24'),
(10, 2, 'Hielo ', 25000, '2016-09-17'),
(11, 8, 'Pago prÃ©stamo ', 500000, '2016-10-09'),
(12, 3, 'Materias primas, fabricaciÃ³n de 4 lotes.', 410000, '2016-10-20'),
(13, 6, 'EnvÃ­o materias primas', 50000, '2016-10-29'),
(14, 2, '3 botellas de vidrio 1 litro (1800) y 50 tapas blancas', 8100, '2016-10-29'),
(15, 3, 'Vodka Absolut para inducciÃ³n vainilla', 25000, '2016-10-28'),
(16, 2, 'Alcohol 75% 1,4 litros ', 7000, '2016-10-30'),
(17, 2, 'Detersin 500ml y detergente con triclosan 500 ml', 9800, '2016-10-28'),
(18, 2, 'Hielo bloque', 19500, '2016-10-31'),
(24, 7, 'Parqueadero capacitaciÃ³n eafit cÃ¡mara de comercio red de angeles inversionistas bavaria', 21300, '2016-11-02'),
(32, 2, 'Tela bolsas de regalo', 42500, '2016-11-05'),
(31, 1, 'Energia', 100000, '2016-11-04'),
(33, 2, 'Pipa de gas 40 lb', 55000, '2016-11-05'),
(34, 10, '4 canastillas verdes, 2 tanques blancos de 60 L y 6 botellas Ã¡mbar de un litro', 170800, '2016-11-11'),
(35, 2, 'Bloque de 23 kg de hielo ', 15000, '2016-11-14'),
(36, 2, 'Botellas de 1L color Ãmbar para gasificaciÃ³n', 27950, '2016-11-17'),
(37, 3, 'Gulupa', 2900, '2016-11-16'),
(38, 9, 'dos empaques regulador de gas, tres tornillos molino y 1 pasador retenedor molino', 5000, '2016-11-17'),
(39, 2, 'Bloque de 27 kg de hielo para enfriamiento ti del mosto', 15000, '2016-11-19'),
(40, 2, 'Hielo', 15000, '2016-12-02'),
(41, 2, 'Pipa de gas 40 lb', 95000, '2016-12-01'),
(42, 2, 'Penta Quat - 1 kg (Desinfectante) y Degratec 25 - 4 kg (detergente)', 37189, '2016-12-06'),
(43, 11, 'Guantes nitrilo largos talla 8 (2 pares)', 49428, '2016-12-15'),
(44, 10, 'Cepillo de cerdas con mango para lavado de etiquetas', 3000, '2016-11-20'),
(45, 3, 'Insumos para 6 tipos de cerveza', 630000, '2016-12-20'),
(46, 6, 'EnvÃ­os materia prima MedellÃ­n pereira', 87000, '2016-12-21'),
(47, 2, 'Microcorrugado blanco 15 laminas de 100x70 cm', 46500, '2016-12-27'),
(48, 2, 'Hielo, bloque de 27kg', 15000, '2017-02-03'),
(49, 2, 'Pipa de gas de 40 lb', 60000, '2017-02-03'),
(50, 1, 'EnergÃ­a ElÃ©ctrica ', 100000, '2017-02-10'),
(51, 10, 'Un termÃ³metro de cristal lÃ­quido de 0-30Â°C y un embotellador', 40000, '2017-02-13'),
(52, 10, '7 canastas para cerveza bavariax30', 21000, '2017-02-14'),
(53, 1, 'Energia', 100000, '2017-01-10'),
(54, 2, 'Tapas, cantidad 1700', 148000, '2017-01-18'),
(55, 2, '1000 etiquetas y un troquel', 300000, '2016-09-07'),
(56, 2, 'Botellas 330 1008 unidades', 733838, '2016-08-07'),
(57, 2, 'Bloque de hielo 27 kg', 15000, '2017-01-03'),
(58, 2, 'Bloque de hielo 27kg', 15000, '2017-01-05'),
(59, 2, 'Dos bloques pequeÃ±os de hielo', 20000, '2017-01-13'),
(60, 2, 'Bloque de hielo 27 kg ', 15000, '2017-01-23'),
(61, 2, 'Bloque de hielo 27 kg', 15000, '2017-01-24'),
(62, 10, 'ConecciÃ³n hidrolavadora para la limpieza de canastas plasticas', 8000, '2017-02-16'),
(63, 7, 'Viaje a Manizales a Cotizar fabricaciÃ³n de molino, etiquetadora y chiller', 30000, '2017-02-28'),
(64, 2, 'papel autoadhesivo sello cajas y opalina regalo', 14100, '2017-02-12'),
(66, 2, '100 etiquetas de prueba', 45000, '2017-02-12'),
(67, 1, 'Energia', 100, '2017-03-08'),
(68, 2, 'Igual para cajas y sobres ', 5800, '2017-03-11'),
(69, 7, 'Viaje a santa rosa y a manizales', 23000, '2017-03-11'),
(70, 2, 'Resma de papel', 9500, '2017-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `fecha_adquisicion` date NOT NULL,
  `costo` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`id`, `id_tipo`, `nombre`, `codigo`, `fecha_adquisicion`, `costo`) VALUES
(2, 3, 'Caja prganizadora', 'CO001', '2016-11-12', 41900),
(3, 6, 'Bolsas hermÃ©ticas', 'BH001', '2016-11-12', 15000),
(4, 6, 'Tapa tipo corona', 'TC001', '2016-11-12', 28224),
(5, 4, 'TermÃ³metro digital caja', 'TD001', '2016-11-12', 15000),
(6, 3, 'Colador cÃ³nico inox 18 cm', 'CI001', '2016-11-12', 44900),
(7, 4, 'Airlokc', 'AL001', '2016-11-12', 19500),
(8, 3, 'TapÃ³n Airlokc', 'TA001', '2016-11-12', 8000),
(9, 3, 'TAPÃ“N DE CAUCHO REUTILIZABLE', 'TA002', '2016-11-12', 16000);

-- --------------------------------------------------------

--
-- Table structure for table `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `respuesta` varchar(2000) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `mensaje`
--

INSERT INTO `mensaje` (`id`, `nombre`, `email`, `descripcion`, `respuesta`, `estado`) VALUES
(7, 'Heinz Brynner Naranjo Barrera ', 'luctatordei@gmail.com', 'Donde puedo adquirir sus productos? Gracias ', 'Hola amigo cervecero, aun no nos encontramos realizando ventas en establecimientos comerciales, debido a que somos un emprendimiento muy nuevo que busca el apoyo econÃ³mico a travÃ©s de pequeÃ±as ventas para el solvento inicial. Actualmente distribuimos a domicilios pequeÃ±as cantidades de (Sixpack a 6000 cada botella) en Pereira, Dosquebradas y  Armenia con tiempo de entrega . Contamos con los siguientes productos: \n\nTATAMÃ, TIPO IMPERIAL STOUT\nProducida con una adiciÃ³n de cafÃ© especial proveniente del eje cafetero, que le brinda un sabor y aroma caracterÃ­sticos, a una bebida oscura, voluminosa, con un color negro azabache opaco, espuma de color marrÃ³n claro bien formada, tostada, con una notable presencia de alcohol, sabores profundos y complejos a chocolate debido al uso de maltas tostadas. El gusto final que puede variar de relativamente seco a levemente dulce, volumen de alcohol: 8Âº-9Âº.\n\nSANTA CHAVA, TIPO IRISH RED ALE\nUna cerveza fÃ¡cil de tomar, de cuerpo liviano a moderado, con un dulzÃ³n a caramelo y una sequedad tostada en el gusto final, color cobre miel, con espuma de tono blancuzco de retenciÃ³n corta, burbujas homogÃ©neas y pequeÃ±as, volumen de alcohol: 4Âº - 6Âº.\n\nDULIMA, TIPO AMERICAN BROWN ALE\nColor marrÃ³n claro, con notas achocolatadas y cÃ­tricas a mandarina, de cuerpo ligero, espuma clara y sensaciÃ³n en paladar persistente con notas tostadas, volumen de alcohol: 4Âº - 6Âº.\n\nCUMANDAY, TIPO ALE:\nDorada pÃ¡lida, brillante, con una espuma duradera, fresca y compleja, refrescante, con notas florales y afrutadas a guayaba manzana, volumen de alcohol: 8Âº - 9Âº.\n\nPuedes contactarnos vÃ­a telefÃ³nica o por whatsApp en Pereira y Dosquebradas al 3122950769 â€“ 3216297766, y en Armenia al 3217501560. TambiÃ©n te esperamos en nuestra pÃ¡gina web http://artesanosdelamontana.com/ en la opciÃ³n contÃ¡ctanos. \n', b'1'),
(9, 'Santiago', 'santiago-c193@hotmail.com', 'Buenas tardes, yo no querÃ­a hacer el pedido, era sÃ³lo para conocer los precios, para cancelarlo por favor', 'Hola amigo cervecero, no hay problema. \n\nRecuerda que puedes contactarnos vÃ­a telefÃ³nica o por whatsApp en Pereira y Dosquebradas al 3122950769 â€“ 3216297766, y en Armenia al 3217501560. TambiÃ©n te esperamos en nuestra pÃ¡gina web http://artesanosdelamontana.com/ en la opciÃ³n contÃ¡ctanos. ', b'1'),
(10, 'Mr. Pavel Kolbaba', 'kolbeerlab@centrum.cz', 'Hola.Yo coleccionista etiquetas de la cerveceria Colombianas. Por favor enviar etiquetas de cervezas Montana.Muchas gracia.Mr. Pavel Kolbaba,Mladeznicka 1274,29301 M. Boleslav,Republica Checa - CZECH REPUBLIC', NULL, b'0'),
(11, 'Erwin tamayo', 'erwinandrest@gmail.com', '2 unidades de cumanday', NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `codigo` varchar(2000) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nombre`, `codigo`, `padre`, `descripcion`, `prioridad`) VALUES
(1, 'Parametrizacion', NULL, -1, NULL, 4),
(2, 'Configuracion', NULL, -1, NULL, 3),
(3, 'Roles', 'Configuration/Rol', 2, NULL, 1),
(4, 'Usuarios', 'Configuration/User', 2, NULL, 2),
(5, 'Inicio', NULL, -1, NULL, 1),
(6, 'Permisos', 'Configuration/Permission', 2, NULL, 3),
(7, 'Prod. Cerveza', 'Parameterization/BeerProduct', 1, NULL, 1),
(8, 'Proceso cervecero', NULL, -1, NULL, 5),
(9, 'Fabricacion', 'Brewery/BeerIn', 8, NULL, 2),
(10, 'Repor Fabr (Pendiente)', 'Brewery/ReporteFabricacion', 8, NULL, 1),
(11, 'Inventario', NULL, -1, NULL, 6),
(12, 'I. Cervezas', 'Inventory/InventaryBeer', 11, NULL, 1),
(13, 'Maquinaria', 'Inventory/Machinery', 11, NULL, 2),
(14, 'Puntos de venta', NULL, -1, NULL, 5),
(15, 'Tip punto (Pendiente)', 'PuntoVenta/TipoPunto', 14, NULL, 2),
(16, 'Punt venta (Pendiente)', 'PuntoVenta/PuntoVenta', 14, NULL, 1),
(17, 'Mensajes', NULL, -1, NULL, 6),
(18, 'Pagina web', 'Message/WebPage', 17, NULL, 1),
(19, 'N. Amargor', 'Parameterization/Bitter', 1, NULL, 2),
(20, 'T. Inventario', 'Parameterization/InventaryType', 1, NULL, 3),
(21, 'T. Gasto', 'Parameterization/SpendType', 1, NULL, 4),
(22, 'Clientes', NULL, -1, NULL, 7),
(23, 'Contactos', 'Client/Contact', 22, NULL, 1),
(24, 'Transacciones', NULL, -1, NULL, 8),
(25, 'Gastos', 'Transaction/Expense', 24, NULL, 2),
(26, 'Departamentos', 'Parameterization/Department', 1, NULL, 5),
(27, 'Municipio', 'Parameterization/City', 1, NULL, 6),
(28, 'Pedidos', 'Transaction/Order', 24, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `menu_rol`
--

CREATE TABLE IF NOT EXISTS `menu_rol` (
  `idrol` int(11) DEFAULT NULL,
  `idmenu` int(11) DEFAULT NULL,
  KEY `menu_usuario_idmenu_fkey` (`idmenu`),
  KEY `menu_usuario_idrol_fkey` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_rol`
--

INSERT INTO `menu_rol` (`idrol`, `idmenu`) VALUES
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 19),
(1, 20),
(1, 21),
(1, 26),
(1, 27),
(1, 9),
(1, 12),
(1, 13),
(1, 18),
(1, 23),
(1, 25),
(1, 28),
(85, 7),
(85, 19),
(85, 20),
(85, 21),
(85, 26),
(85, 27),
(85, 9),
(85, 12),
(85, 13),
(85, 18),
(85, 23),
(85, 25),
(85, 28);

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `fechapedido` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `idciudad` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcliente` (`idcliente`),
  KEY `idciudad` (`idciudad`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id`, `idcliente`, `fechapedido`, `direccion`, `idciudad`, `estado`, `descripcion`) VALUES
(46, 10, '2017-02-08', 'CRA 13 #2e 04 la aurora bloque 9 apto 304', 1, b'1', NULL),
(45, 8, '2017-02-06', 'Cr 22 # 24-54 Mz 1 Cs 22', 1, b'1', NULL),
(76, 7, '2017-03-04', 'Claro 17 No 4-58', 1, b'1', ''),
(51, 9, '2017-02-11', 'Calle17#4-58', 1, b'1', NULL),
(49, 11, '2017-02-08', 'Loma linda dosquebradas', 1, b'0', NULL),
(50, 12, '2017-02-08', 'Calle 17#4-58', 1, b'1', NULL),
(53, 9, '2017-02-12', 'Calle17#4-58', 1, b'1', NULL),
(58, 10, '2017-02-14', 'CRA 13 #2e 04 la aurora bloque 9 apto 304', 1, b'1', NULL),
(55, 12, '2017-02-13', 'Calle 17#4-58', 1, b'1', NULL),
(62, 9, '2017-02-22', 'Calle17#4-58', 1, b'0', NULL),
(57, 9, '2017-02-14', 'Calle17#4-58', 1, b'0', NULL),
(59, 13, '2017-02-15', 'Cra 15 bis # 10b-40 apartamento 402', 1, b'1', NULL),
(60, 13, '2017-02-19', 'Bulevar de las Villas m8 c 13', 1, b'1', NULL),
(61, 9, '2017-02-19', 'Calle17#4-58', 1, b'0', NULL),
(63, 9, '2017-02-22', 'Calle17#4-58', 1, b'1', NULL),
(64, 9, '2017-02-22', 'Calle17#4-58', 1, b'1', NULL),
(74, 9, '2017-03-04', 'Calle17#4-58', 1, b'1', 'PEDIDO ENTREGADO EL 28 DE FEBRERO A ALEJANDRO MONSALVE, PEDIDO A TRAVES DE INSTAGRAM'),
(66, 9, '2017-02-23', 'Calle17#4-58', 1, b'0', NULL),
(67, 9, '2017-02-23', 'Calle17#4-58', 1, b'1', NULL),
(71, 10, '2017-02-28', 'CRA 13 #2e 04 la aurora bloque 9 apto 304', 1, b'1', ''),
(72, 14, '2017-02-28', 'cll 11 # 12b - 20', 1, b'1', ''),
(73, 15, '2017-03-03', 'Car5#18-33', 1, b'1', ''),
(75, 9, '2017-03-04', 'Calle17#4-58', 1, b'1', 'PARA SEBASTIAN, SE ENTREGO EL 18 DE FEBRERO'),
(78, 12, '2017-03-04', 'Calle 17#4-58', 1, b'0', 'SÃ³lo se ha cancelado una.'),
(79, 9, '2017-03-04', 'Calle17#4-58', 1, b'1', 'PizzerÃ­a a la rÃºstica pizza al horno'),
(80, 9, '2017-03-04', 'Calle17#4-58', 1, b'0', 'Elias Naranjo'),
(81, 14, '2017-03-05', 'cll 11 # 12b - 20', 1, b'1', ''),
(82, 10, '2017-03-05', 'CRA 13 #2e 04 la aurora bloque 9 apto 304', 1, b'1', ''),
(83, 12, '2017-03-06', 'Calle 17#4-58', 1, b'1', ''),
(84, 13, '2017-03-07', 'Bulevar de las Villas m8 c 13', 1, b'0', 'CPC y otro'),
(85, 9, '2017-03-07', 'Calle17#4-58', 1, b'0', 'Tres muestras a cambio de apoyo tÃ©cnico en el diseÃ±o y fabricaciÃ³n de los sistemas de enfriamiento '),
(86, 9, '2017-03-07', 'Calle17#4-58', 1, b'0', 'Muestras para RagnarÃ¶k, afianzamiento de relaciones comerciales'),
(94, 8, '2017-03-09', 'Cr 22 # 24-54 Mz 1 Cs 22', 1, b'1', ''),
(95, 7, '2017-03-12', 'Claro 17 No 4-58', 1, b'1', ''),
(96, 13, '2017-03-12', 'Bulevar de las Villas m8 c 13', 1, b'0', ''),
(97, 17, '2017-03-14', 'calle 22 # 18-08 barrio providencia', 1, b'1', 'telefono 3103567485 horario de 8 a 5'),
(98, 8, '2017-03-14', 'Cr 22 # 24-54 Mz 1 Cs 22', 1, b'1', ''),
(99, 13, '2017-03-15', 'Bulevar de las Villas m8 c 13', 1, b'1', ''),
(100, 13, '2017-03-16', 'Bulevar de las Villas m8 c 13', 1, b'0', ''),
(101, 12, '2017-03-16', 'Calle 17#4-58', 1, b'0', 'Pedido para Erwin Tamayo'),
(102, 9, '2017-03-16', 'Calle17#4-58', 1, b'1', 'Pizzeria a la rustica'),
(103, 13, '2017-03-17', 'Bulevar de las Villas m8 c 13', 1, b'0', '5 sixpack '),
(104, 9, '2017-03-17', 'Calle17#4-58', 1, b'0', 'Julio Pizzeria '),
(105, 12, '2017-03-19', 'Calle 17#4-58', 1, b'0', 'Pedida por Jose Espitia');

-- --------------------------------------------------------

--
-- Table structure for table `pedidoproducto`
--

CREATE TABLE IF NOT EXISTS `pedidoproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) DEFAULT NULL,
  `idcerveza` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpedido` (`idpedido`),
  KEY `idcerveza` (`idcerveza`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `pedidoproducto`
--

INSERT INTO `pedidoproducto` (`id`, `idpedido`, `idcerveza`, `cantidad`) VALUES
(24, 51, 4, 5),
(18, 46, 4, 2),
(17, 45, 4, 6),
(23, 51, 2, 5),
(21, 49, 4, 4),
(22, 50, 4, 2),
(67, 78, 1, 2),
(65, 76, 4, 2),
(27, 53, 2, 2),
(28, 53, 4, 5),
(35, 58, 4, 7),
(34, 58, 2, 2),
(31, 55, 4, 1),
(40, 62, 2, 2),
(33, 57, 2, 3),
(36, 59, 2, 2),
(37, 59, 4, 2),
(38, 60, 3, 3),
(39, 61, 3, 8),
(41, 62, 3, 2),
(42, 62, 4, 2),
(43, 63, 4, 1),
(44, 64, 2, 2),
(45, 64, 3, 2),
(46, 64, 4, 2),
(62, 74, 2, 3),
(48, 66, 2, 2),
(49, 66, 3, 2),
(50, 66, 4, 2),
(51, 67, 2, 12),
(52, 67, 3, 16),
(53, 67, 4, 5),
(57, 71, 3, 3),
(58, 72, 2, 16),
(59, 72, 3, 6),
(60, 73, 1, 1),
(61, 73, 2, 1),
(63, 74, 3, 3),
(64, 75, 3, 1),
(68, 79, 2, 10),
(69, 79, 4, 10),
(70, 80, 4, 4),
(71, 81, 4, 10),
(72, 82, 1, 4),
(73, 82, 2, 1),
(74, 82, 3, 1),
(75, 83, 2, 2),
(76, 84, 1, 1),
(77, 84, 2, 1),
(78, 85, 3, 3),
(79, 86, 2, 1),
(80, 86, 3, 1),
(89, 94, 2, 2),
(88, 94, 1, 2),
(90, 94, 3, 2),
(91, 95, 2, 2),
(92, 95, 3, 2),
(93, 96, 1, 1),
(94, 96, 2, 1),
(95, 96, 3, 1),
(96, 97, 1, 4),
(97, 97, 2, 4),
(98, 97, 3, 4),
(99, 98, 1, 2),
(100, 99, 1, 1),
(101, 100, 2, 1),
(102, 100, 3, 1),
(103, 101, 1, 2),
(104, 102, 1, 5),
(105, 102, 3, 5),
(106, 103, 1, 10),
(107, 103, 2, 10),
(108, 103, 3, 10),
(109, 104, 1, 15),
(110, 105, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `descripcion`) VALUES
(1, 'administrador', 'Super administrador del sistema, tiene todos los permisos'),
(85, 'artesano', 'Tiene todos los permisos, excepto configuracion de roles, usuarios y permisos de usuario');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cerveza`
--

CREATE TABLE IF NOT EXISTS `tipo_cerveza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(2000) NOT NULL,
  `alcohol` double NOT NULL,
  `amargor` int(11) NOT NULL,
  `valor` double NOT NULL,
  `cantidad` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amargor` (`amargor`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tipo_cerveza`
--

INSERT INTO `tipo_cerveza` (`id`, `nombre`, `descripcion`, `alcohol`, `amargor`, `valor`, `cantidad`) VALUES
(1, 'Cumanday', 'Cerveza dorada', 8, 2, 5000, 330),
(2, 'Dulima', 'Cerveza marron', 5, 1, 5000, 330),
(3, 'Santa Chava', 'Cerveza roja ', 5, 1, 5000, 330),
(4, 'TamamÃ¡', 'Cerveza negra', 8, 3, 5000, 330);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cliente`
--

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Empresa', ''),
(2, 'Persona natural', '');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_gasto`
--

CREATE TABLE IF NOT EXISTS `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tipo_gasto`
--

INSERT INTO `tipo_gasto` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Servicios publicos', ''),
(2, 'Insumos', ''),
(3, 'Materias primas', ''),
(4, 'Eventos', ''),
(5, 'Publicidad', ''),
(6, 'Transporte', ''),
(7, 'Gastos administrativos', ''),
(8, 'Obligaciones legales', ''),
(9, 'Mantenimiento', ''),
(10, 'Equipos', ''),
(11, 'EPPÂ´S', 'Elementos de protecciÃ³n personal');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_inventario`
--

CREATE TABLE IF NOT EXISTS `tipo_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tipo_inventario`
--

INSERT INTO `tipo_inventario` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Materia prima', ''),
(2, 'Insumo', ''),
(3, 'Utencilios', ''),
(4, 'Equipos', ''),
(6, 'Consumible', '');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_rol_fkey` (`rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `usuario`, `password`, `rol`, `descripcion`) VALUES
(1, 'Johnny', 'Alexander', 'Salazar', 'Cardona', 'johnny9052', 'df5be1862ca6bf8589cf799004248e87', 1, ''),
(2, 'Luisa', 'Fernanda ', 'Espitia', 'Delgado', 'Pepper', 'ea7d2140a0cdb9d630e1e1d5991dcfa0', 85, ''),
(3, 'Ricardo', '', 'Naranjo', 'GarcÃ­a', 'Osito', '445b80cd0e8c7143a2c6873658ed2723', 85, ''),
(4, 'Sebastian', '', 'Valencia', 'Zuluaga', 'zvsebastian', '25d55ad283aa400af464c76d713c07ad', 85, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vbeerin`
--
CREATE TABLE IF NOT EXISTS `vbeerin` (
`id` int(11)
,`tipo` varchar(50)
,`cantidad` decimal(32,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vbeerout`
--
CREATE TABLE IF NOT EXISTS `vbeerout` (
`id` int(11)
,`tipo` varchar(50)
,`cantidad` decimal(33,0)
);
-- --------------------------------------------------------

--
-- Structure for view `vbeerin`
--
DROP TABLE IF EXISTS `vbeerin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artesano`@`localhost` SQL SECURITY DEFINER VIEW `vbeerin` AS select `tip`.`id` AS `id`,`tip`.`nombre` AS `tipo`,sum(`ent`.`cantidad`) AS `cantidad` from (`entrada_cerveza` `ent` join `tipo_cerveza` `tip` on((`ent`.`id_tipo_cerveva` = `tip`.`id`))) group by `tip`.`nombre` order by `tip`.`nombre`;

-- --------------------------------------------------------

--
-- Structure for view `vbeerout`
--
DROP TABLE IF EXISTS `vbeerout`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artesano`@`localhost` SQL SECURITY DEFINER VIEW `vbeerout` AS select `tip`.`id` AS `id`,`tip`.`nombre` AS `tipo`,-(sum(`sal`.`cantidad`)) AS `cantidad` from (`pedidoproducto` `sal` join `tipo_cerveza` `tip` on((`sal`.`idcerveza` = `tip`.`id`))) group by `tip`.`nombre` order by `tip`.`nombre`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
