-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2022 a las 19:44:50
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendabici.php`
--
CREATE DATABASE IF NOT EXISTS `tiendabici.php` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tiendabici.php`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idpersonaFK` int NOT NULL,
  `numerocomprascliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idpersonaFK`, `numerocomprascliente`) VALUES
(1, '10'),
(2, '2'),
(1, '10'),
(2, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `idcompra` int NOT NULL,
  `idproductoFK` int NOT NULL,
  `fechacompra` date NOT NULL,
  `idpersonaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idcompra`, `idproductoFK`, `fechacompra`, `idpersonaFK`) VALUES
(1, 1, '2022-04-05', 1),
(2, 2, '2022-04-15', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `idmarca` int NOT NULL,
  `modelosmarca` varchar(45) NOT NULL,
  `preciomarca` varchar(45) NOT NULL,
  `telefonomarca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idmarca`, `modelosmarca`, `preciomarca`, `telefonomarca`) VALUES
(1, 'scott spark', '9000', '948557788'),
(2, 'canyon lux', '5000', '954752633');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas` (
  `idpersona` int NOT NULL,
  `nombrepersona` varchar(45) NOT NULL,
  `apellidospersona` varchar(45) NOT NULL,
  `dnipersona` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idpersona`, `nombrepersona`, `apellidospersona`, `dnipersona`) VALUES
(1, 'Pepe', 'Beltrán Pacheco', '24547260S'),
(2, 'Alfredo', 'Miguel Gordón', '41265361D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idproducto` int NOT NULL,
  `nombreproducto` varchar(45) NOT NULL,
  `cantidadproducto` varchar(45) NOT NULL,
  `precioproducto` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `nombreproducto`, `cantidadproducto`, `precioproducto`) VALUES
(1, 'bielas sram', '5', '300.00'),
(2, 'bielas shimano', '7', '310.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `idpersonaFK` int NOT NULL,
  `preciosproveedor` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idpersonaFK`, `preciosproveedor`) VALUES
(1, '50.00'),
(2, '60.00'),
(1, '50.00'),
(2, '60.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

DROP TABLE IF EXISTS `repartidor`;
CREATE TABLE `repartidor` (
  `idpersonaFK` int NOT NULL,
  `horariosrepartidor` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`idpersonaFK`, `horariosrepartidor`) VALUES
(1, '8'),
(2, '12'),
(1, '8'),
(2, '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suministrar`
--

DROP TABLE IF EXISTS `suministrar`;
CREATE TABLE `suministrar` (
  `idsuministro` int NOT NULL,
  `idproductoFK` int NOT NULL,
  `idmarcaFK` int NOT NULL,
  `fechasuministro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `suministrar`
--

INSERT INTO `suministrar` (`idsuministro`, `idproductoFK`, `idmarcaFK`, `fechasuministro`) VALUES
(1, 1, 2, '2023-04-27'),
(2, 2, 1, '2022-04-30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD KEY `idpersonaFK` (`idpersonaFK`),
  ADD KEY `idpersonaFK_2` (`idpersonaFK`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `idproductoFK` (`idproductoFK`),
  ADD KEY `idpersonaFK` (`idpersonaFK`),
  ADD KEY `idproductoFK_2` (`idproductoFK`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`idmarca`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD KEY `idpersonaFK` (`idpersonaFK`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD KEY `idpersonaFK` (`idpersonaFK`),
  ADD KEY `idpersonaFK_2` (`idpersonaFK`);

--
-- Indices de la tabla `suministrar`
--
ALTER TABLE `suministrar`
  ADD PRIMARY KEY (`idsuministro`),
  ADD KEY `idproductoFK` (`idproductoFK`),
  ADD KEY `idmarcaFK` (`idmarcaFK`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idpersonaFK`) REFERENCES `personas` (`idpersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idproductoFK`) REFERENCES `productos` (`idproducto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`idpersonaFK`) REFERENCES `personas` (`idpersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`idpersonaFK`) REFERENCES `personas` (`idpersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`idpersonaFK`) REFERENCES `personas` (`idpersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `suministrar`
--
ALTER TABLE `suministrar`
  ADD CONSTRAINT `suministrar_ibfk_1` FOREIGN KEY (`idproductoFK`) REFERENCES `productos` (`idproducto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `suministrar_ibfk_2` FOREIGN KEY (`idmarcaFK`) REFERENCES `marcas` (`idmarca`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
