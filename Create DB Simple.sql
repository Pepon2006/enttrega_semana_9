DROP SCHEMA if exists isosceles;

CREATE DATABASE  if NOT exists isosceles;
USE isosceles;

CREATE TABLE if NOT exists isosceles.tipo_id (
		id_tipo INT NOT NULL AUTO_INCREMENT,
		tipo_id	VARCHAR (30) NOT NULL,
        PRIMARY KEY (id_tipo)
);

CREATE TABLE if NOT exists isosceles.pais (
		id_pais	INT NOT NULL AUTO_INCREMENT,
		pais 	VARCHAR (40) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY(id_pais)
);
	
    CREATE TABLE if NOT exists isosceles.region (
		id_region	INT NOT NULL AUTO_INCREMENT,
        id_pais INT NOT NULL,
		region	VARCHAR(30) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_region)
);

CREATE TABLE if NOT exists isosceles.rubro(
		id_rubro  INT NOT NULL AUTO_INCREMENT,
        rubro  VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_rubro)
);

CREATE TABLE if NOT exists isosceles.tipo_cuenta(
		id_tipo_cuenta INT NOT NULL AUTO_INCREMENT,
        nomb_cuenta VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_tipo_cuenta)
);

CREATE TABLE if not exists isosceles.marca(
		id_marca INT NOT NULL AUTO_INCREMENT,
		nonb_marca	VARCHAR (50),
		PRIMARY KEY (id_marca)
);

CREATE TABLE if NOT exists isosceles.entidad_emisora(
		id_entidad INT NOT NULL AUTO_INCREMENT,
        nomb_entidad VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_entidad)
);

	CREATE TABLE if NOT exists isosceles.tarjeta(
		id_tarjeta INT NOT NULL AUTO_INCREMENT,
        nomb_tarjeta VARCHAR (50) NOT NULL DEFAULT 'Sin DatosS',
        PRIMARY KEY (id_tarjeta)
);

	CREATE TABLE if NOT exists isosceles.tipo_tarjeta(
		id_tipo_tarjeta INT NOT NULL AUTO_INCREMENT,
        tipo_tarjeta VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_tipo_tarjeta)
);
CREATE TABLE isosceles.producto(
		id_producto INT NOT NULL AUTO_INCREMENT,
        nomb_producto 	VARCHAR (50),
		PRIMARY KEY (id_producto)
);

CREATE TABLE if NOT exists isosceles.usuario (
		id_usuario	INT NOT NULL AUTO_INCREMENT,
		id_tusuario		INT,
        usuario		VARCHAR  (50) NOT NULL,
        contrasena	VARCHAR(35) NOT NULL,
		nombre		VARCHAR(30) DEFAULT 'Sin Datos',
		apellido	VARCHAR(40) DEFAULT 'Sin Datos',
        fecha_nac	DATE,
        PRIMARY KEY (id_usuario)
);

CREATE TABLE if NOT exists isosceles.info_personal (
		id_personal INT NOT NULL AUTO_INCREMENT,
        id_tipo INT NOT NULL,
        id_usuario	INT NOT NULL,
		num_personal	VARCHAR(30) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_personal)
);

 CREATE TABLE if NOT exists isosceles.domicilios (
		id_domi  INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT NOT NULL,
        id_pais  INT NOT  NULL,
        id_region	INT NOT NULL,
        domicilio	VARCHAR(50) NOT NULL DEFAULT 'Sin Datos',
        codigo_post  VARCHAR (35),
        PRIMARY KEY (id_domi)
);

 CREATE TABLE if NOT exists isosceles.tipo_usuario (
		id_tusuario INT NOT NULL AUTO_INCREMENT,
        categoria  VARCHAR (100) NOT NULL,
        Comision DECIMAL (5,2) DEFAULT '0.00',
        PRIMARY KEY (id_tusuario)
);

CREATE TABLE if NOT exists isosceles.info_finan_usuario(
		id_finan INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_cuenta INT NOT NULL,
        num_cuenta VARCHAR (30) DEFAULT 'Sin Datos',
        alias VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_finan)
);

	CREATE TABLE if NOT exists isosceles.info_finan_tarjetas_usuario(
		id_info_tarjeta INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_tarjeta INT NOT NULL,
        id_tarjeta INT NOT NULL,
        num_tarjeta VARCHAR (25) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_info_tarjeta)
);
	
  
 CREATE TABLE if NOT exists isosceles.contacto_tel(
		id_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        num_tel VARCHAR(30) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_contacto)
);

CREATE TABLE if NOT exists isosceles.email_contacto(
		id_e_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        email VARCHAR (50) DEFAULT 'Noinformado@.ggggg',
        PRIMARY KEY (id_e_contacto)
);

-- CREAR TABLA NUEVA CATEGORIA

CREATE TABLE if NOT exists categoria(
		id_categoria INT NOT NULL AUTO_INCREMENT,
        -- id_rubro INT NOT NULL,
        categoria VARCHAR (100) DEFAULT 'Sin Sub-rubro',
        PRIMARY KEY (id_categoria)
);
        
 CREATE TABLE if not exists isosceles.ingreso_pro(
		id_ingreso INT NOT NULL AUTO_INCREMENT,
		id_usuario INT NOT NULL,
		id_rubro INT NOT NULL,
        id_categoria INT NOT NULL,
        acreditacion INT NOT NULL,
        id_marca INT NOT NULL,
        id_producto  INT NOT NULL,
		unidades INT,
		sku INT,
		precio DECIMAL (9,2),
		descripcion VARCHAR (200),
		PRIMARY KEY (id_ingreso)
);

CREATE TABLE if not exists isosceles.egreso_pro(
		id_engreso INT NOT NULL AUTO_INCREMENT,
		id_usuario INT NOT NULL,
		id_rubro INT NOT NULL,
        id_categoria INT NOT NULL,
        id_marca 	INT NOT NULL,
        id_producto INT NOT NULL,
        fpago	INT NOT NULL,
        envio 	int not null,
        unidades INT,
		PRIMARY KEY (id_engreso)
);

						-- DECLARACION DE LAS FK DE TODAS LAS TABLAS

ALTER TABLE isosceles.usuario
	ADD CONSTRAINT `fk_tipousuario` FOREIGN KEY (id_tusuario) REFERENCES tipo_usuario (id_tusuario);
	
    
ALTER TABLE isosceles.region
	ADD CONSTRAINT `fk_regpais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais);
 
    
ALTER TABLE isosceles.info_personal    
    ADD CONSTRAINT `fk_tipo` FOREIGN KEY (id_tipo) REFERENCES tipo_id (id_tipo),
	ADD CONSTRAINT `fk_usuariotipo` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

    
ALTER TABLE isosceles.domicilios
	ADD CONSTRAINT `fk_domiusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	ADD  CONSTRAINT `fk_dompais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais),
	ADD CONSTRAINT `fk_domiregion` FOREIGN KEY (id_region) REFERENCES region (id_region);
    
     
ALTER TABLE isosceles.info_finan_usuario
     ADD CONSTRAINT `fk_finausuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_finanemisor` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_finantipo` FOREIGN KEY (id_tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta);
     
ALTER TABLE isosceles.info_finan_tarjetas_usuario
     ADD CONSTRAINT `fk_tarjeusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_tarjemi` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_tarjetipo` FOREIGN KEY (id_tipo_tarjeta) REFERENCES tipo_tarjeta (id_tipo_tarjeta),
	 ADD CONSTRAINT `fk_tarjeta` FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta);


ALTER TABLE isosceles.ingreso_pro 
	ADD CONSTRAINT `fk_ingrusuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    ADD CONSTRAINT `fk_ingrubro`  FOREIGN KEY (id_rubro) REFERENCES rubro (id_rubro),
    ADD CONSTRAINT  `fk_ingcategoria` FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
	ADD CONSTRAINT `fk_ing_acredi` FOREIGN KEY (acreditacion) REFERENCES info_finan_usuario (id_finan),
    ADD CONSTRAINT `fk_ingmarca`  FOREIGN KEY (id_marca) REFERENCES marca (id_marca),	
    ADD CONSTRAINT `fk_ingproduc` FOREIGN KEY (id_producto) REFERENCES producto (id_producto);
	
    
ALTER TABLE isosceles.egreso_pro
	ADD CONSTRAINT `fk_usuario_egreso` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    ADD CONSTRAINT `fk_rubro_egreso` FOREIGN KEY  (id_rubro) REFERENCES rubro (id_rubro),
    ADD CONSTRAINT `fk_categoria_egreso` FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    ADD CONSTRAINT `fk_marca_egreso` FOREIGN KEY (id_marca) REFERENCES marca (id_marca),
    ADD CONSTRAINT `fk_prod_egreso`  FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
    ADD CONSTRAINT `fk_fpago_egreso` FOREIGN KEY (fpago) REFERENCES info_finan_tarjetas_usuario (id_info_tarjeta),
    ADD CONSTRAINT `fk_envio_egreso` FOREIGN KEY (envio) REFERENCES  domicilios (id_domi);
    
						-- MODIFICACIONES 
		-- PARA AUMENTAR LA CANTIDAD DE CARACTERES DE LA COLUMNA REGION 
	SET FOREIGN_KEY_CHECKS = 0;
	USE isosceles;
	ALTER TABLE region
	MODIFY COLUMN region VARCHAR (100); 
	SET FOREIGN_KEY_CHECKS = 1;
    
    
    	-- PARA AUMENTAR LA CANTIDAD DE CARACTERES DE LA COLUMNA TIPO_ID
    ALTER TABLE isosceles.tipo_id
    MODIFY COLUMN tipo_id  VARCHAR (50);
    
    
    USE isosceles;
DROP FUNCTION IF EXISTS `nombre_completo`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `nombre_completo` (usuario INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	DECLARE v_id_usuario INT;
	DECLARE v_nombre VARCHAR(100);
    DECLARE v_apellido VARCHAR(100);
    DECLARE v_completo VARCHAR(100);
    SET v_id_usuario = (SELECT id_usuario FROM usuario ORDER BY id_usuario DESC LIMIT 1);
    SET v_nombre = (SELECT nombre FROM usuario WHERE id_usuario = usuario);
    SET v_apellido = (SELECT apellido FROM usuario WHERE id_usuario = usuario);
    
		IF usuario <= v_id_usuario 	THEN
			SET v_completo = concat(v_nombre, ' ', v_apellido);
        ELSE
			SET v_completo = 'Valor fuera de rango';
		END IF;
    RETURN v_completo;
END$$
DELIMITER ;



-- FUNCION PAR AVER SI EXISTE LA CATEGORIA DE USUARIO DEL 1 AL 6 SON EXISTENTES

USE `isosceles`;
DROP function IF EXISTS `existe_categoria_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE FUNCTION `existe_categoria_usuario` (nuevo_cate_usuario INT)
RETURNs VARCHAR (150)
READS SQL DATA

BEGIN
	DECLARE nivel VARCHAR (150) ;
	DECLARE nuevo_nivel VARCHAR (150);
	DECLARE mensaje VARCHAR(150);
	DECLARE niv VARCHAR (150);
	SET niv= (CONCAT('Nivel',' ',nuevo_cate_usuario));
	SET nivel= (SELECT categoria FROM tipo_usuario WHERE (niv = categoria));
	SET nuevo_nivel = niv;
		IF nuevo_nivel = nivel THEN
			SET mensaje = 'Error,nivel existente';
		ELSE
			SET mensaje ='Es posible crear este nuevo nivel';	
		END IF;
        RETURN mensaje;
END$$

DELIMITER ;		
            
-- FUNCION PARA EL CALCULO DE COMISIOPNES POR VENTA A MEJORAR EL USUARIO Y LA COMISION HASTA AHORA FUNCIONA ASI

USE isosceles;
DROP FUNCTION IF EXISTS  `calculo_comisiones`;
DELIMITER $$
USE isosceles$$
CREATE FUNCTION `calculo_comisiones` (id_usuario INT, precio DECIMAL (9,2), unidades INT)
RETURNS DECIMAL (9,2)
READS SQL DATA
BEGIN
DECLARE comision DECIMAL (9,2);
	IF id_usuario = 1 THEN
		SET comision = ((precio * unidades) * 0.20);
	ELSEIF id_usuario = 2 THEN
		SET comision = ((precio * unidades) * 0.18);
    ELSEIF id_usuario = 3 THEN
		SET comision = ((precio * unidades) * 0.15);
    ELSEIF id_usuario = 4 THEN
		SET comision = ((precio * unidades) * 0.10);
    ELSEIF id_usuario = 5 THEN
		SET comision = ((precio * unidades) * 0.05); 
    ELSEIF id_usuario = 6 THEN
		SET comision = ((precio * unidades) * 0.03);    
    ELSE 
    SET comision = 0.00;
    END IF;
    RETURN comision;
END$$
DELIMITER ;

-- FUNCION PARA VER SI ESXITE MARCA 
USE isosceles;
DROP FUNCTION IF EXISTS `existe_marca`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_marca` (nomb_marca VARCHAR (100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE v_marca VARCHAR (100);
DECLARE regresa INT;
DECLARE v_id_marca INT;
SET v_marca = (SELECT nonb_marca FROM marca WHERE nomb_marca = nonb_marca); 
SET v_id_marca = (SELECT id_marca FROM marca WHERE nonb_marca = v_marca);
	IF LCASE(v_marca) = LCASE(nomb_marca) THEN
    SET regresa =v_id_marca;
    ELSE 
    SET regresa =0;
END IF;
RETURN regresa;
END $$
DELIMITER ;



-- FUNCION PARA VER SI ESXITE PRODUCTO
USE isosceles;
DROP FUNCTION IF EXISTS `existe_producto`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_producto` (var_nomb_producto VARCHAR (100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE v_producto VARCHAR (100);
DECLARE regresa INT;
DECLARE v_id_producto INT;
SET v_producto = (SELECT nomb_producto FROM producto WHERE nomb_producto = var_nomb_producto); 
SET v_id_producto = (SELECT id_producto FROM producto WHERE nomb_producto = v_producto);
	IF LCASE(v_producto) = LCASE(var_nomb_producto) THEN
    SET regresa =v_id_producto;
    ELSE 
    SET regresa =0;
END IF;
RETURN regresa;
END $$
DELIMITER ;


-- FUNCION PARA SABER SI EXISTE EL NOMBRE DE USUARIO
USE isosceles;
DROP FUNCTION IF EXISTS `existe_nomb_usuario`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_nomb_usuario` (var_nomb_usuario VARCHAR (100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE v_usuario VARCHAR (100);
DECLARE regresa INT;
DECLARE v_id_usuario INT;
SET v_usuario= (SELECT usuario FROM usuario WHERE usuario = var_nomb_usuario); 
SET v_id_usuario = (SELECT id_usuario FROM usuario WHERE usuario = v_usuario);
	IF  EXISTS (SELECT LCASE(usuario) FROM usuario WHERE (LCASE(v_usuario) = LCASE(var_nomb_usuario))) THEN
    SET regresa =v_id_usuario;
    ELSE 
    SET regresa =0;
END IF;
RETURN regresa;
END $$
DELIMITER ;

-- FUNCION PASA SABER SI EXISTE EL TIPO DE IDENTIFICACION EJEMPLO PASAPORTE Y QUE ID LE CORESPONDE

USE isosceles;
DROP FUNCTION IF EXISTS `tipo_de_identificacion`;
DELIMITER $$
USE isosceles$$
CREATE FUNCTION `tipo_de_identificacion` (identificacion VARCHAR (100))
RETURNS VARCHAR (100)
READS SQL DATA
BEGIN
DECLARE var_identi INT;
DECLARE v_identi VARCHAR (100);
DECLARE mensaje VARCHAR (100);
SET @var_identi = (SELECT id_tipo FROM tipo_id WHERE tipo_id = identificacion);
-- SET v_identi = (SELECT tipo_id FROM tipo_id WHERE tipo_id = identificacion);
	IF EXISTS (SELECT LCASE(tipo_id) FROM tipo_id WHERE LCASE(tipo_id) = LCASE(identificacion)) THEN  
		SET mensaje =@var_identi;
        -- SET mensaje = CONCAT_WS(' ','El tipo de identificacion es',identificacion, 'que es el id N°', var_identi);
        ELSE
        SET mensaje =0;
        END IF;
RETURN mensaje;
END$$
DELIMITER ;
        
        
-- SP PARA INGRESAR NUEVA CATEGORIA DE USUARIO SI NO EXISTE, DEL 1 AL 6 SON LAS EXISTENTES

USE `isosceles`;
DROP PROCEDURE IF EXISTS `agregar_nueva_categoria`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `agregar_nueva_categoria` (IN nueva_cate_usuario INT)
READS SQL DATA

BEGIN
	DECLARE nivel VARCHAR (150) ;
	DECLARE nuevo_nivel VARCHAR (150);
	DECLARE mensaje VARCHAR(150);
	DECLARE niv VARCHAR (150);
	SET niv= (CONCAT('Nivel',' ',nueva_cate_usuario));
	SET nivel= (SELECT categoria FROM tipo_usuario WHERE (niv = categoria));
	SET nuevo_nivel = niv;
		IF nuevo_nivel = nivel THEN
			SET mensaje = 'Error,nivel existente';
		ELSE
			INSERT INTO tipo_usuario(categoria) VALUES (nuevo_nivel);
            SET mensaje = 'Es posible crear este nuevo nivel';	
		END IF;
END$$

DELIMITER ;		

            
 -- SP PARA LA CARGA DE NUEVOS USUARIOS TOMANDO COMO PARAMETRO PARA LA CARGA QUE EL TIPO DE ID(Pasaporte) T SU NUMEROS
    -- COMBINADOS NO ESTEN REGISTRADOS
    -- EJEMPLO nue_tipoid Pasaporte  numid_nuev 330306423 DEBE NO HACER LA CARGA DE DATOS
     --                   Cedula de Identidad   252562474  DEBE NO HACER LA CARGA DE DATOS   
     -- SE DEBEN RESPETAR LAS MAYUSCULAS, NO PUDE CORREGIR ESO
     
     
USE `isosceles`;
DROP PROCEDURE IF EXISTS `ingresar_nuevo_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `ingresar_nuevo_usuario` (nue_tipoid VARCHAR (50), numid_nuev VARCHAR (30),n_usuario VARCHAR (50), nombre VARCHAR (50), 
								  apellido VARCHAR (150), fecha_nac DATE, password VARCHAR (150))

READS SQL DATA

BEGIN
	DECLARE tipoidexist VARCHAR (150) ;
    DECLARE numidexist VARCHAR (150);
    DECLARE usuarioexist VARCHAR (150);
    DECLARE mensaje VARCHAR(150);
    DECLARE nuevo_id INT;
	SET tipoidexist = (SELECT tipo_id FROM tipo_id WHERE (nue_tipoid = tipo_id));
	SET numidexist = (SELECT num_personal FROM info_personal WHERE (num_personal = numid_nuev  ));
	SET usuarioexist = (SELECT usuario FROM usuario WHERE (n_usuario = usuario)); 
		IF ( (SELECT tipo_de_identificacion(nue_tipoid)) AND  numidexist = numid_nuev  ) THEN
			SET mensaje = "tipo de identificacion y numero, ya registrados";
            
            
		ELSEIF (SELECT existe_nomb_usuario(n_usuario)) THEN
        -- EXISTS (SELECT LCASE(usuario) FROM usuario WHERE (usuarioexist = n_usuario)) THEN SE CAMBIO USANDO LA FUNCION SI ESXITE USUARIO VER SI FUNCIONA
               SET mensaje = "Nombre de usuario ya existe, igrese otro"; 
		ELSE
              INSERT INTO usuario (id_tusuario,usuario,contrasena,nombre,apellido,fecha_nac)
              VALUES (1,LCASE(n_usuario),password,LCASE(nombre),LCASE(apellido),fecha_nac);
			  SET nuevo_id = (SELECT id_usuario FROM usuario ORDER BY id_usuario DESC LIMIT 1);
              INSERT INTO info_personal (id_tipo,id_usuario,num_personal)
					 VALUES (@var_identi,nuevo_id,numid_nuev);
            -- SET mensaje = 'Se procedio a la carga de datos en la Tabla usuario';
         END IF;    

END$$
DELIMITER ;                 

-- STORED PARA CAMBIAR LA CONTRASEÑA DE UN USUARIO

USE `isosceles`;
DROP PROCEDURE IF EXISTS `modifica_contrasena_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `modifica_contrasena_usuario` (ingusuario VARCHAR (100), contrasena_actual VARCHAR (100),
											   contrasena_nueva VARCHAR (100))
READS SQL DATA

BEGIN
	DECLARE v_id_usuario INT;
	DECLARE v_usuario VARCHAR (150) ;
	DECLARE v_contrasena VARCHAR (150);
    DECLARE var_usuario VARCHAR (100);
	DECLARE mensaje VARCHAR(150);
	SET @v_id_usuario= (SELECT id_usuario FROM usuario WHERE usuario = ingusuario);
	SET v_contrasena= (SELECT contrasena FROM usuario WHERE id_usuario = @v_id_usuario);
    SET var_usuario = (SELECT usuario FROM usuario WHERE id_usuario = @v_id_usuario);
			IF 	(ingusuario = var_usuario AND contrasena_actual = v_contrasena)THEN
				  SET SQL_SAFE_UPDATES=0;
				  UPDATE usuario SET contrasena = contrasena_nueva 
                  WHERE id_usuario = @v_id_usuario;
                  SET SQL_SAFE_UPDATES=1;
			 ELSE    
				SET mensaje = (SELECT contrasena FROM usuario WHERE id_usuario = v_id_usuario);	
		 END IF;
END$$
DELIMITER ;

-- STORED PARA CAMBIAR EL NOMBRE DE USUARIO NO FUNCIONA VER PORQUE NO ESTA FUNCIONANDO BIEN

USE `isosceles`;
DROP PROCEDURE IF EXISTS `modifica_nombre_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `modifica_nombre_usuario` (ingusuario VARCHAR (100), contrasena VARCHAR (100),
											   nuevo_usuario VARCHAR (100))
READS SQL DATA

BEGIN
	DECLARE var_id_usuario INT;
	DECLARE var_usuario VARCHAR (150) ;
	DECLARE var_contrasena VARCHAR (150);
    DECLARE v_usuario VARCHAR (100);
	DECLARE mensaje VARCHAR(150);
	SET @var_id_usuario= (SELECT id_usuario FROM usuario WHERE usuario = ingusuario);
	SET var_contrasena= (SELECT contrasena FROM usuario WHERE id_usuario = @var_id_usuario);
	SET v_usuario = (SELECT usuario FROM usuario WHERE id_usuario = @var_id_usuario);
			IF 	(ingusuario = v_usuario AND contrasena = var_contrasena AND nuevo_usuario <> v_usuario)THEN
                  SET SQL_SAFE_UPDATES=0;
				  UPDATE usuario SET usuario = nuevo_usuario 
                  WHERE id_usuario = @var_id_usuario;
                  SET SQL_SAFE_UPDATES=1;
			 ELSE    
				SET mensaje = (SELECT contrasena FROM usuario WHERE id_usuario = @var_id_usuario);	
		 END IF;
END$$

DELIMITER ;		

 -- VISTA QUE MUESTRA LOS PRIMERO 50 PRODUCTOS CON MAS STOCK
CREATE OR REPLACE VIEW listado_prouctos_mas_stock AS
(SELECT 
unidades
,MAX(precio) AS precio_mas_alto
,MIN(precio) AS precio_mas_bajo
,AVG(precio) AS precio_promedio
,descripcion
,p.nomb_producto
FROM ingreso_pro i
INNER JOIN producto p 
ON (p.id_producto = i.id_producto)
GROUP BY i.id_producto
ORDER BY SUM(unidades) DESC LIMIT 50
);

 -- DATOS PARA REALIZAR ENVIO
CREATE OR REPLACE VIEW datos_envio AS
(SELECT 
	nombre_completo (u.id_usuario) AS Nombre_y_Apellido
-- ,   r.region
-- ,   p.pais 
,	domicilio	
,	codigo_post
,	p.nomb_producto
,	unidades
FROM egreso_pro e
	INNER JOIN usuario u
	ON (e.id_usuario = u.id_usuario)
    INNER JOIN domicilios d
    ON (envio = d.id_domi)
    INNER JOIN producto p
    ON (e.id_producto = p.id_producto)
);  
      
  -- 	DATOS DE CONTACTO DE LOS USUARIOS MENOR NIVEL 3 SIN TELEFONO
CREATE OR REPLACE VIEW contacto_usuario_menor_nivel3 AS 
(SELECT 
nombre_completo (u.id_usuario) AS Nombre_y_Apellido
,email
,num_tel
FROM email_contacto e
	INNER JOIN usuario u
		ON e.id_usuario = u.id_usuario
	INNER JOIN contacto_tel t
		ON e.id_usuario = t.id_usuario
WHERE id_tusuario < 3 AND num_tel LIKE '%sin%'
);  

-- LA MISMA MUESTRA LOS TIPOS DE CUENTAS POSIBLES PARA CADA USUARIO Y LA COMISION DE CADA UNA
USE isosceles;
CREATE OR REPLACE VIEW tipos_de_usuarios AS
(SELECT categoria, comision
FROM tipo_usuario
);
    
    
   