-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-12-2019 a las 19:17:24
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id11750105_bdproyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `cuentadantes` ()  select idUsuario, nombre from usuario where rol = "cuentadante"$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paActualizarElemento` (`nuevaPlaca` VARCHAR(20), `nuevoEstado` VARCHAR(30), `nuevaCategoria` VARCHAR(30), `nuevoSerial` VARCHAR(20), `nuevaDescripcion` VARCHAR(200), `nuevoNumeroAmbiente` INT, `nIdElemento` INT)  UPDATE ELEMENTO
        SET estado= nuevoEstado,
            categoria = nuevaCategoria,
            serial = nuevoSerial,
            descripcion = nuevaDescripcion,
            numeroAmbiente = nuevoNumeroAmbiente 
        WHERE idElemento = nIdElemento$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paActualizarNovedadLeida` ()  update novedad set leido ='1' where leido ='0'$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paActualizarNovedadLeidaSP` ()  update novedadsp set leido ='1' where leido ='0'$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paActualizarUsuario` (IN `usuNick` VARCHAR(20), IN `usuRol` VARCHAR(20), IN `usuNombre` VARCHAR(50), IN `usuCorreo` VARCHAR(50))  UPDATE usuario
        SET rol = usuRol, 
            nombre = usuNombre, 
            correo = usuCorreo
        WHERE nick = usuNick$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paAsignarAmbientes` (`nIdUsuario` INT, `nNumeroAmbiente` INT)  insert into ambientesusuario (idUsuario,numeroAmbiente) VALUES (nIdUsuario,nNumeroAmbiente)$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paCambiarContra` (`usuNick` VARCHAR(20), `usuClave` VARCHAR(30), `usuClavenew` VARCHAR(30))  UPDATE usuario
        SET clave = usuClavenew
        WHERE nick = usuNick AND clave = usuClave$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarAmbiente` (`nuevoamb` INT(11))  SELECT * FROM ambiente 
	WHERE numero = nuevoamb$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarContraseña` (IN `ncorreo` VARCHAR(50))  NO SQL
SELECT clave from usuario where correo = ncorreo$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarCorreo` (IN `nCorreo` VARCHAR(50))  NO SQL
select correo from usuario where correo = ncorreo$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarDisponibilidad` (IN `disponibilidad` INT(11))  SELECT * FROM ambiente 
	WHERE numero = disponibilidad$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarElementoId` (`nIdElemento` INT)  SELECT * FROM elemento 
        WHERE idElemento = nIdElemento$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarElementoPlaca` (`nuevaPlaca` VARCHAR(20))  SELECT * FROM elemento 
	WHERE placa = nuevaPlaca$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarNovedadLeida` ()  SELECT*from novedad where leido = '0'$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarNovedadLeidaSP` ()  Select*from novedadsp where leido = '0'$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarNovedadSPAmbiente` (`nuevoambiente` INT(11))  SELECT * FROM ambiente
	WHERE numero = nuevoambiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paConsultarPorNick` (`usuNick` VARCHAR(20))  SELECT * FROM usuario
        WHERE nick = usuNick$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paDesasignarAmbientes` (`nNumeroAmbiente` INT)  delete from ambientesusuario where numeroAmbiente=nNumeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paEliminarAmbientes` (`num` INT(11))  DELETE FROM ambiente 
        WHERE numero = num$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paEliminarElemento` (`nuevaPlaca` VARCHAR(20))  DELETE FROM elemento 
        WHERE placa = nuevaPlaca$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paEliminarUsuario` (`usuNick` VARCHAR(20))  DELETE FROM usuario
	WHERE nick = usuNick$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paInsertarAmbientes` (`nuevoamb` INT(11), `nuevoestado` VARCHAR(1))  INSERT INTO ambiente(numero, disponible) 
        VALUES (nuevoamb,nuevoestado)$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paInsertarElemento` (`nuevaPlaca` VARCHAR(20), `nuevoEstado` VARCHAR(30), `nuevaCategoria` VARCHAR(30), `nuevoSerial` VARCHAR(20), `nuevaDescripcion` VARCHAR(200), `nuevoNumeroAmbiente` INT)  INSERT INTO elemento(placa, estado, categoria, serial, descripcion, numeroAmbiente) 
        VALUES (nuevaPlaca,nuevoEstado, nuevaCategoria, nuevoSerial,nuevaDescripcion, 
                nuevoNumeroAmbiente)$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paInsertarNovedad` (IN `nuevaDescripcion` VARCHAR(100), IN `nuevoEstado` VARCHAR(30), IN `nuevoidUsuario` INT, IN `nuevoIdElemento` INT)  INSERT INTO novedad (descripcion, estado,fecha, idUsuario, IdElemento)
VALUES (nuevaDescripcion,nuevoEstado,(select curdate()),nuevoidUsuario,nuevoIdElemento)$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paInsertarNovedadSP` (`nuevaDescripcion` VARCHAR(100), `nuevoidUsuario` INT, `nuevoAmbiente` INT(11))  INSERT INTO novedadsp (descripcion, idUsuarioSP, ambiente)
VALUES (nuevaDescripcion,nuevoidUsuario,nuevoAmbiente)$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paInsertarUsuario` (`nick` VARCHAR(20), `clave` VARCHAR(30), `rol` VARCHAR(20), `nombre` VARCHAR(50), `correo` VARCHAR(50))  INSERT INTO usuario (nick,clave,rol,nombre,correo)
        VALUES (nick,clave,rol,nombre,correo)$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarAmbientes` ()  select * from ambiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarElementoAmbiente` (`nuevoNumeroAmbiente` INT)  SELECT * FROM elemento 
	WHERE numeroAmbiente = nuevoNumeroAmbiente
        ORDER BY placa$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarElementoAmbienteEstado` (`nuevoEstado` VARCHAR(30), `nuevoNumeroAmbiente` INT)  SELECT * FROM elemento 
	WHERE estado = nuevoEstado AND numeroAmbiente = nuevoNumeroAmbiente 
	ORDER BY numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarElementoEstado` (`estado` VARCHAR(30))  SELECT * FROM elemento 
	WHERE estado = estado 
	ORDER BY numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarElementos` ()  SELECT * FROM elemento
        ORDER BY numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `palistarElementosCuentadante` (`nidUsuario` INT)  select * from ambientesusuario inner join elemento on ambientesusuario.numeroAmbiente=elemento.numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarNovedades` ()  select nov.descripcion,nov.estado,nov.fecha,usu.nick,ele.placa from novedad nov
inner join usuario usu on usu.idUsuario = nov.idUsuario
inner join elemento ele on ele.idElemento = nov.IdElemento
order by nov.fecha desc$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarNovedadesAño` ()  NO SQL
select * from novedad where YEAR(fecha) = YEAR(curdate())$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarNovedadesDia` ()  select * from novedad where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate()) and DAY(fecha) = DAY(curdate())$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarNovedadesMes` ()  NO SQL
select * from novedad where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate())$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarNovedadesSP` ()  select novsp.descripcion,novsp.fecha,usu.nick,novsp.ambiente from novedadsp novsp
inner join usuario usu on usu.idUsuario = novsp.idUsuarioSP
order by fecha desc$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarNovedadesTotales` ()  NO SQL
select * from novedad$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paListarUsuarios` ()  SELECT * FROM usuario$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadCorreoPlaca` (IN `nPlaca` VARCHAR(20))  NO SQL
select usuario.correo, elemento.numeroAmbiente, elemento.placa from elemento inner join ambientesusuario on ambientesusuario.numeroAmbiente = elemento.numeroAmbiente inner join usuario on usuario.idUsuario = ambientesusuario.idUsuario where idElemento = nplaca$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesAmbienteAño` ()  NO SQL
select elemento.numeroAmbiente, novedad.estado from novedad inner join elemento on novedad.IdElemento=elemento.idElemento where YEAR(fecha) = YEAR(curdate()) order by elemento.numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesAmbienteDia` ()  NO SQL
select elemento.numeroAmbiente, novedad.estado from novedad inner join elemento on novedad.IdElemento=elemento.idElemento where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate()) and DAY(fecha) = DAY(curdate()) order by elemento.numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesAmbienteMes` ()  NO SQL
select elemento.numeroAmbiente, novedad.estado from novedad inner join elemento on novedad.IdElemento=elemento.idElemento where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate()) order by elemento.numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesAmbienteTotales` ()  NO SQL
select elemento.numeroAmbiente, novedad.estado from novedad inner join elemento on novedad.IdElemento=elemento.idElemento order by elemento.numeroAmbiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesSPAmbienteAño` ()  NO SQL
select ambiente from novedadsp where YEAR(fecha) = YEAR(curdate()) order by ambiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesSPAmbienteDia` ()  NO SQL
select ambiente from novedadsp where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate()) and DAY(fecha) = DAY(curdate()) order by ambiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesSPAmbienteMes` ()  NO SQL
select ambiente from novedadsp where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate()) order by ambiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNovedadesSPAmbienteTotal` ()  NO SQL
select ambiente from novedadsp order by ambiente$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paNumeroDia` ()  NO SQL
select COUNT(*) from novedad where YEAR(fecha) = YEAR(curdate()) and MONTH(fecha) = MONTH(curdate()) and DAY(fecha) = DAY(curdate())$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paRecuperarContraseña` (IN `ncorreo` VARCHAR(50))  NO SQL
select clave from usuario where correo = ncorreo$$

CREATE DEFINER=`id11750105_senasinova`@`%` PROCEDURE `paValidarAcceso` (IN `usuNick` VARCHAR(20), IN `usuClave` VARCHAR(30))  SELECT idUsuario,rol,nick,correo FROM usuario
        WHERE nick = usuNick AND clave = usuClave$$

--
-- Funciones
--
CREATE DEFINER=`id11750105_senasinova`@`%` FUNCTION `nombreUsuario` (`nickUsu` VARCHAR(20)) RETURNS VARCHAR(50) CHARSET latin1 BEGIN
	RETURN (select nombre from  Usuario where nick = nickUsu);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambiente`
--

CREATE TABLE `ambiente` (
  `numero` int(11) NOT NULL,
  `disponible` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ambiente`
--

INSERT INTO `ambiente` (`numero`, `disponible`) VALUES
(101, '0'),
(201, '0'),
(301, '0'),
(310, '1'),
(401, '1'),
(501, '1'),
(510, '1'),
(601, '1'),
(610, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientesusuario`
--

CREATE TABLE `ambientesusuario` (
  `idAmbienteUsuario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `numeroAmbiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ambientesusuario`
--

INSERT INTO `ambientesusuario` (`idAmbienteUsuario`, `idUsuario`, `numeroAmbiente`) VALUES
(30, 2, 201),
(31, 4, 101),
(33, 4, 301);

--
-- Disparadores `ambientesusuario`
--
DELIMITER $$
CREATE TRIGGER `disponible` BEFORE DELETE ON `ambientesusuario` FOR EACH ROW update ambiente SET disponible = 1 where numero = old.numeroAmbiente
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `nodisponible` BEFORE INSERT ON `ambientesusuario` FOR EACH ROW update ambiente SET disponible = 0 where numero = NEW.numeroAmbiente
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento`
--

CREATE TABLE `elemento` (
  `idElemento` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `serial` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `numeroAmbiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `elemento`
--

INSERT INTO `elemento` (`idElemento`, `placa`, `estado`, `categoria`, `serial`, `descripcion`, `numeroAmbiente`) VALUES
(4, 'abc-123', 'Dañado', 'equipo', '123-abc', 'PC Lenovo Mac', 101),
(12, 'cab-123', 'Desconfigurado', 'equipo', '123-cab', 'PC Lenovo ideapad 320', 101),
(15, 'asd-123', 'mesaDeAyuda', 'equipo', '123-asd', 'PC Lenovo ideapad 320', 601),
(16, 'das-123', 'buenEstado', 'televisor', '123-das', 'SmartTV Viera', 401),
(17, 'zxc-123', 'desconfigurado', 'equipo', '123-zxc', 'Computadora 1', 201),
(18, 'zxc-124', 'buenEstado', 'equipo', '124-zxc', 'Computadora 2', 201),
(19, 'zxc-125', 'buenEstado', 'equipo', '125-zxc', 'Computadora 3', 201),
(20, 'zxc-126', 'buenEstado', 'equipo', '126-zxc', 'Computadora 4', 201),
(21, 'zxc-127', 'buenEstado', 'equipo', '127-zxc', 'Computadora 5', 201),
(22, 'zxc-128', 'buenEstado', 'equipo', '128-zxc', 'Computadora 6', 201),
(25, '888JJJ', 'dañado', 'EQUIPO', '123-jjj', 'ok', 101),
(26, '123456', 'buenEstado', 'EQUIPO', '1234-4321', 'Monitor Lenovo', 601),
(27, '234657', 'buenEstado', 'Equipo', 'asdc-1243', 'Monitor Lenovo', 401),
(28, '23654', 'buenEstado', 'Equipo', '2543-asdf', 'Monitor Lenovo', 501);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `idNovedad` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `idUsuario` int(11) NOT NULL,
  `IdElemento` int(11) DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  `leido` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `novedad`
--

INSERT INTO `novedad` (`idNovedad`, `descripcion`, `fecha`, `idUsuario`, `IdElemento`, `estado`, `leido`) VALUES
(1, 'El elemento ha dejado de funcionar', '2019-10-02 05:00:00', 2, 12, 'Dañado', '1'),
(2, 'El elemento fue reparado y esta de nuevo en el aula.', '2019-10-03 05:00:00', 2, 12, 'En buen Estado', '1'),
(3, 'El equipo no muestra el sistema operativo.', '2019-10-03 05:00:00', 2, 12, 'Desconfigurado', '1'),
(4, 'tiene fallo en la unidad x', '2019-10-21 05:00:00', 2, 12, 'Desconfigurado', '1'),
(5, 'tiene fallo en la unidad 2x', '2019-10-21 05:00:00', 7, 25, 'Dañado', '1'),
(8, 'el elemento no tiene teclado', '2019-10-30 05:00:00', 7, 12, 'Dañado', '1'),
(14, 'a', '2019-11-11 23:01:03', 7, 25, 'Dañado', '1'),
(15, 'b', '2019-11-11 23:01:03', 1, 18, 'En buen Estado', '1'),
(16, 'c', '2019-11-11 23:02:45', 14, 15, 'En mesa de ayuda', '1'),
(17, 'd', '2019-11-11 23:02:45', 14, 17, 'Desconfigurado', '1'),
(18, 'x', '2019-11-11 23:03:03', 7, 4, 'No encontrado', '1'),
(19, 'g', '2019-11-11 23:11:23', 14, 4, 'Dañado', '1'),
(20, 'El elemento está dañado', '2019-11-14 05:00:00', 2, 12, 'En mesa de ayuda', '1'),
(21, 'el elemento está dañado', '2019-11-14 05:00:00', 2, 12, 'En mesa de ayuda', '1'),
(22, 'El equipo está dañado ', '2019-12-02 00:00:00', 2, 12, 'En mesa de ayuda', '1'),
(23, 'No prende', '2019-12-02 00:00:00', 2, 4, 'Dañado', '1'),
(24, 'El elemento no se encuenta en el ambiente.', '2019-12-07 00:00:00', 2, 12, 'No encontrado', '1'),
(25, 'El elemento fue devuelto al ambiente en buenas condiciones.', '2019-12-09 00:00:00', 2, 12, 'En buen Estado', '1'),
(26, 'El elemento no carga el sistema operativo.', '2019-12-09 00:00:00', 2, 12, 'Desconfigurado', '1');

--
-- Disparadores `novedad`
--
DELIMITER $$
CREATE TRIGGER `updelem` BEFORE INSERT ON `novedad` FOR EACH ROW update elemento set elemento.estado=new.estado where elemento.idElemento=new.IdElemento
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedadsp`
--

CREATE TABLE `novedadsp` (
  `idNovedadSP` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `idUsuarioSP` int(11) NOT NULL,
  `ambiente` int(11) DEFAULT NULL,
  `leido` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `novedadsp`
--

INSERT INTO `novedadsp` (`idNovedadSP`, `descripcion`, `fecha`, `idUsuarioSP`, `ambiente`, `leido`) VALUES
(1, 'Un aprendiz ha roto una de las sillas.', '2019-09-30 18:08:56', 2, 101, '1'),
(2, 'Una de las ventanas se encuentra rota.', '2019-10-03 17:48:00', 2, 501, '1'),
(3, 'xD', '2019-10-31 01:56:30', 2, 101, '1'),
(4, 'a', '2019-10-31 02:05:58', 2, 101, '1'),
(5, 'Se ha roto una ventana del ambiente a causa de una mala maniobra de un aprendiz', '2019-12-07 03:05:28', 2, 101, '1'),
(6, 'Un aprendíz a quebrado una de las ventanas del ambiente.', '2019-12-09 10:48:18', 2, 301, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nick`, `clave`, `rol`, `nombre`, `correo`) VALUES
(1, 'wasalias', 'empanadas123', 'admin', 'Wilson Salinas', 'wasalinas50@misena.edu.co'),
(2, 'fegasu', '12345', 'cuentadante', 'Fernando Galindo', 'fegasu@misena.edu.co'),
(4, 'jepuerto', '123', 'cuentadante', 'Juan Puerto', 'jepuerto2@misena.edu.co'),
(5, 'lezamora', '123', 'admin', 'Esteban Zamora', 'lezamora@misena.edu.co'),
(7, 'azambri', '123', 'colaborador', 'Alex Zambrano', 'azambri50@misena.edu.co'),
(8, 'snhernandez', '123', 'colaborador', 'Sergio Hernandez', 'snhernandez@misena.edu.co'),
(9, 'mfbarrero', '123', 'cuentadante', 'Maria Barrero', 'mfbarrero@misena.edu.co'),
(10, 'earodriguez', '123', 'colaborador', 'Esteban Rodriguez', 'earodriguez@misena.edu.co'),
(13, 'lhperez', '123', 'colaborador', 'Luis Perez', 'leperez@misena.edu.co'),
(14, 'caguasca', '123', 'colaborador', 'Camilo Guasca', 'caguasca@misena.edu.co'),
(15, 'asd', '123', 'colaborador', 'asd', 'asd'),
(16, 'x', 'x', 'admin', 'x', 'x@gmail.com'),
(17, 'd', 'd', 'admin', 'd', 'd@gmail.com'),
(18, 'prueba', '347', 'colaborador', 'soyprueba', 'soyprueba@prueba.com'),
(28, 'eapolo', '430', 'admin', 'Eberto Polo', 'eapolo3@misena.edu.co'),
(30, 'cdlopez', '613', 'colaborador', 'Camlia Dayana Lopez', 'cdlopez@gmail.com'),
(31, 'carodriguez', '339', 'colaborador', 'Camilo rodriguez', 'carodriguz@gmail.com'),
(33, 'zato', 'KEG2VqUFfC', 'cuentadante', 'Za To', 'zamoripa10@gmail.com');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewambientesusuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewambientesusuario` (
`Usuario` varchar(50)
,`Numero del ambiente` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `viewambientesusuario`
--
DROP TABLE IF EXISTS `viewambientesusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id11750105_senasinova`@`%` SQL SECURITY DEFINER VIEW `viewambientesusuario`  AS  select `usu`.`nombre` AS `Usuario`,`ambusu`.`numeroAmbiente` AS `Numero del ambiente` from (`ambientesusuario` `ambusu` join `usuario` `usu` on(`usu`.`idUsuario` = `ambusu`.`idUsuario`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambiente`
--
ALTER TABLE `ambiente`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `ambientesusuario`
--
ALTER TABLE `ambientesusuario`
  ADD PRIMARY KEY (`idAmbienteUsuario`),
  ADD KEY `FK_Ambusu_Usu` (`idUsuario`),
  ADD KEY `FK_Ambusu_Amb` (`numeroAmbiente`);

--
-- Indices de la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`idElemento`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD KEY `Ele_Amb` (`numeroAmbiente`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`idNovedad`),
  ADD KEY `Nov_Usu` (`idUsuario`),
  ADD KEY `Nov_Ele` (`IdElemento`);

--
-- Indices de la tabla `novedadsp`
--
ALTER TABLE `novedadsp`
  ADD PRIMARY KEY (`idNovedadSP`),
  ADD KEY `NovSP_Usu` (`idUsuarioSP`),
  ADD KEY `Amb_NSP` (`ambiente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nick` (`nick`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientesusuario`
--
ALTER TABLE `ambientesusuario`
  MODIFY `idAmbienteUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `elemento`
--
ALTER TABLE `elemento`
  MODIFY `idElemento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `novedad`
--
ALTER TABLE `novedad`
  MODIFY `idNovedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `novedadsp`
--
ALTER TABLE `novedadsp`
  MODIFY `idNovedadSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ambientesusuario`
--
ALTER TABLE `ambientesusuario`
  ADD CONSTRAINT `FK_Ambusu_Amb` FOREIGN KEY (`numeroAmbiente`) REFERENCES `ambiente` (`numero`),
  ADD CONSTRAINT `FK_Ambusu_Usu` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD CONSTRAINT `Ele_Amb` FOREIGN KEY (`numeroAmbiente`) REFERENCES `ambiente` (`numero`);

--
-- Filtros para la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD CONSTRAINT `Nov_Ele` FOREIGN KEY (`IdElemento`) REFERENCES `elemento` (`idElemento`),
  ADD CONSTRAINT `Nov_Usu` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `novedadsp`
--
ALTER TABLE `novedadsp`
  ADD CONSTRAINT `Amb_NSP` FOREIGN KEY (`ambiente`) REFERENCES `ambiente` (`numero`),
  ADD CONSTRAINT `NovSP_Usu` FOREIGN KEY (`idUsuarioSP`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
