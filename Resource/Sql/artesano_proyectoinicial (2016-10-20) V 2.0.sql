-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-10-2016 a las 17:04:11
-- Versión del servidor: 10.0.27-MariaDB
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `artesano_proyectoinicial`
--

DELIMITER $$
--
-- Procedimientos
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
        select tip.id, tip.nombre as 'tipo', SUM(ent.cantidad) as 'cantidad disponible'
        from entrada_cerveza as ent
        inner join tipo_cerveza as tip on ent.id_tipo_cerveva = tip.id
        group by tip.nombre
        order by tip.nombre;
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

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `listclient`(iduser int)
    COMMENT 'Procedimiento que calcula y lista los clientes'
BEGIN
        select cli.id, tip.nombre as 'Tipo', cli.nombre,cli.code as 'Codigo',
               cli.email,cli.direccion,cli.telefono,cli.observaciones
        from cliente as cli
        inner join tipo_cliente as tip on cli.id_tipo_cliente = tip.id
        order by tip.nombre;
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

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `login`(IN `usu` VARCHAR(50), IN `pass` VARCHAR(50))
    COMMENT 'Procedimiento que valida las credenciales de un usuairo'
BEGIN
   select usuario,primer_nombre,primer_apellido,rol from usuario where password=pass and usuario=usu;		
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

CREATE DEFINER=`artesano`@`localhost` PROCEDURE `searchclient`(idclient int)
    COMMENT 'Procedimiento que carga la informacion de una entrada de cerveza'
BEGIN
 
	
	select id,id_tipo_cliente,nombre,code,email,direccion,
               telefono,observaciones
	from cliente
	where id = idclient;
	
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

--
-- Funciones
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

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveexpense`(vid INT,vTypeexpense INT,
                            vDescription varchar(2000), vValue DOUBLE,
                            vDateExpense date                           
                           ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un gasto'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select id from gasto 
              where id_tipo_gasto=vTypeexpense AND fecha = vDateExpense)
		THEN
			insert into gasto(id_tipo_gasto,observaciones,
                                           valor,fecha) 
                               values(vTypeexpense,vDescription,vValue,
                                      vDateExpense);
			set res = 1;										
		END IF;
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

CREATE DEFINER=`artesano`@`localhost` FUNCTION `saveorder`(vidcliente integer, vdireccion varchar(50), vproducts varchar(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un pedido de cervezas'
BEGIN 
    DECLARE res INT DEFAULT 0;
    /*Variable que contendra el tipo de cerveza a almacenar*/
    DECLARE vidcerveza varchar(50) DEFAULT '';    
    /*Variable que contendra la cantidad de cerveza pedida*/
    DECLARE vcantidad varchar(50) DEFAULT '';

    INSERT INTO pedido(idcliente,fechapedido,direccion) values (vidcliente, NOW(),vdireccion);
	
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
-- Estructura de tabla para la tabla `amargor`
--

CREATE TABLE IF NOT EXISTS `amargor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `amargor`
--

INSERT INTO `amargor` (`id`, `nombre`, `descripcion`) VALUES
(1, 'bajo', ''),
(2, 'medio', ''),
(3, 'alto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `id_tipo_cliente`, `nombre`, `code`, `email`, `direccion`, `telefono`, `observaciones`, `password`) VALUES
(2, 2, 'Cliente de prueba', '123456789', 'prueba@prueba.com', 'direccion de prueba', '3217591569', 'Se registro por la pagina', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_cerveza`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `entrada_cerveza`
--

INSERT INTO `entrada_cerveza` (`id`, `id_tipo_cerveva`, `cantidad`, `presentacion`, `lote`, `fecha_fabricacion`, `fecha_gasificacion`, `observaciones`) VALUES
(4, 3, 110, '330', '40004', '2016-10-01', '2016-10-15', ''),
(5, 1, 72, '330', '20003', '2016-09-24', '2016-10-08', ''),
(6, 4, 48, '330', '30005', '2016-09-17', '2016-10-01', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE IF NOT EXISTS `gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_gasto` int(11) NOT NULL,
  `observaciones` varchar(2000) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_gasto` (`id_tipo_gasto`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `gasto`
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
(11, 8, 'Pago prÃ©stamo ', 500000, '2016-10-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `respuesta` varchar(2000) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id`, `nombre`, `email`, `descripcion`, `respuesta`, `estado`) VALUES
(7, 'Heinz Brynner Naranjo Barrera ', 'luctatordei@gmail.com', 'Donde puedo adquirir sus productos? Gracias ', 'Hola amigo cervecero, aun no nos encontramos realizando ventas en establecimientos comerciales, debido a que somos un emprendimiento muy nuevo que busca el apoyo econÃ³mico a travÃ©s de pequeÃ±as ventas para el solvento inicial. Actualmente distribuimos a domicilios pequeÃ±as cantidades de (Sixpack a 6000 cada botella) en Pereira, Dosquebradas y  Armenia con tiempo de entrega . Contamos con los siguientes productos: \n\nTATAMÃ, TIPO IMPERIAL STOUT\nProducida con una adiciÃ³n de cafÃ© especial proveniente del eje cafetero, que le brinda un sabor y aroma caracterÃ­sticos, a una bebida oscura, voluminosa, con un color negro azabache opaco, espuma de color marrÃ³n claro bien formada, tostada, con una notable presencia de alcohol, sabores profundos y complejos a chocolate debido al uso de maltas tostadas. El gusto final que puede variar de relativamente seco a levemente dulce, volumen de alcohol: 8Âº-9Âº.\n\nSANTA CHAVA, TIPO IRISH RED ALE\nUna cerveza fÃ¡cil de tomar, de cuerpo liviano a moderado, con un dulzÃ³n a caramelo y una sequedad tostada en el gusto final, color cobre miel, con espuma de tono blancuzco de retenciÃ³n corta, burbujas homogÃ©neas y pequeÃ±as, volumen de alcohol: 4Âº - 6Âº.\n\nDULIMA, TIPO AMERICAN BROWN ALE\nColor marrÃ³n claro, con notas achocolatadas y cÃ­tricas a mandarina, de cuerpo ligero, espuma clara y sensaciÃ³n en paladar persistente con notas tostadas, volumen de alcohol: 4Âº - 6Âº.\n\nCUMANDAY, TIPO ALE:\nDorada pÃ¡lida, brillante, con una espuma duradera, fresca y compleja, refrescante, con notas florales y afrutadas a guayaba manzana, volumen de alcohol: 8Âº - 9Âº.\n\nPuedes contactarnos vÃ­a telefÃ³nica o por whatsApp en Pereira y Dosquebradas al 3122950769 â€“ 3216297766, y en Armenia al 3217501560. TambiÃ©n te esperamos en nuestra pÃ¡gina web http://artesanosdelamontana.com/ en la opciÃ³n contÃ¡ctanos. \n', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `codigo` varchar(2000) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `menu`
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
(25, 'Gastos', 'Transaction/Expense', 24, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_rol`
--

CREATE TABLE IF NOT EXISTS `menu_rol` (
  `idrol` int(11) DEFAULT NULL,
  `idmenu` int(11) DEFAULT NULL,
  KEY `menu_usuario_idmenu_fkey` (`idmenu`),
  KEY `menu_usuario_idrol_fkey` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_rol`
--

INSERT INTO `menu_rol` (`idrol`, `idmenu`) VALUES
(85, 3),
(85, 4),
(85, 6),
(85, 7),
(85, 19),
(85, 20),
(85, 21),
(85, 9),
(85, 12),
(85, 13),
(85, 18),
(85, 23),
(85, 25),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 19),
(1, 20),
(1, 21),
(1, 9),
(1, 12),
(1, 13),
(1, 18),
(1, 23),
(1, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `fechapedido` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcliente` (`idcliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoproducto`
--

CREATE TABLE IF NOT EXISTS `pedidoproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) DEFAULT NULL,
  `idcerveza` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpedido` (`idpedido`),
  KEY `idcerveza` (`idcerveza`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `descripcion`) VALUES
(1, 'administrador', 'Super administrador del sistema, tiene todos los permisos'),
(85, 'artesano', 'Tiene todos los permisos, excepto configuracion de roles, usuarios y permisos de usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cerveza`
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
-- Volcado de datos para la tabla `tipo_cerveza`
--

INSERT INTO `tipo_cerveza` (`id`, `nombre`, `descripcion`, `alcohol`, `amargor`, `valor`, `cantidad`) VALUES
(1, 'Cumanday', 'Cerveza dorada', 8, 2, 5000, 330),
(2, 'Dulima', 'Cerveza marron', 5, 1, 5000, 330),
(3, 'Santa Chava', 'Cerveza roja ', 5, 1, 5000, 330),
(4, 'TamamÃ¡', 'Cerveza negra', 8, 3, 5000, 330);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Empresa', ''),
(2, 'Persona natural', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_gasto`
--

CREATE TABLE IF NOT EXISTS `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `tipo_gasto`
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
(9, 'Mantenimiento', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_inventario`
--

CREATE TABLE IF NOT EXISTS `tipo_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tipo_inventario`
--

INSERT INTO `tipo_inventario` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Materia prima', ''),
(2, 'Insumo', ''),
(3, 'Utencilios', ''),
(4, 'Equipos', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `usuario`, `password`, `rol`, `descripcion`) VALUES
(1, 'Johnny', 'Alexander', 'Salazar', 'Cardona', 'johnny9052', 'df5be1862ca6bf8589cf799004248e87', 1, ''),
(2, 'Luisa', 'Fernanda ', 'Espitia', 'Delgado', 'Pepper', 'ea7d2140a0cdb9d630e1e1d5991dcfa0', 85, ''),
(3, 'Ricardo', '', 'Naranjo', 'GarcÃ­a', 'Osito', '445b80cd0e8c7143a2c6873658ed2723', 85, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
