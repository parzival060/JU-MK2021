-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-05-2021 a las 02:57:17
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id16928591_ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraDetalle`
--

CREATE TABLE `compraDetalle` (
  `detalleId` int(11) UNSIGNED NOT NULL,
  `compraId` int(11) UNSIGNED NOT NULL,
  `productoId` int(11) UNSIGNED NOT NULL,
  `cantidad` int(5) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `compraId` int(11) UNSIGNED NOT NULL,
  `transactionId` varchar(100) DEFAULT NULL,
  `usuarioId` int(11) UNSIGNED NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productoId` int(11) UNSIGNED NOT NULL,
  `precio` int(5) NOT NULL,
  `precioOferta` int(5) DEFAULT NULL,
  `enOferta` char(1) NOT NULL DEFAULT '0' COMMENT '0 - Sin oferta, 1 - Con Oferta',
  `descripcion` varchar(100) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `categoria` enum('dama','caballero','ninios','bebes') NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '0 - Inactivo, 1 - Activo',
  `destacado` char(1) NOT NULL DEFAULT '1',
  `existencia` int(3) NOT NULL,
  `vendidos` int(3) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`productoId`, `precio`, `precioOferta`, `enOferta`, `descripcion`, `marca`, `imagen`, `categoria`, `status`, `destacado`, `existencia`, `vendidos`, `creado`) VALUES
(1, 7, 0, '0', 'Bubulubu', 'Ricolino', '/public/img/bubulubu.png', 'dama', '1', '1', 12, 0, '2020-02-21'),
(2, 15, 0, '0', 'Gansito', 'Marinela', '/public/img/gansito.png', 'caballero', '0', '1', 11, 1, '2020-02-21'),
(3, 10, 0, '1', 'Kranky', 'Ricolino', '/public/img/kranky.png', 'dama', '1', '1', 11, 0, '2020-02-21'),
(4, 5, 0, '0', 'Pelon', 'Ricolino', '/public/img/pelon.png', 'dama', '1', '1', 5, 1, '2020-02-21'),
(5, 30, 0, '0', 'Peperoni', 'Kir', '/public/img/peperoni.png', 'ninios', '1', '0', 11, 0, '2020-02-21'),
(6, 14, 0, '0', 'Pinol', 'Limpieza', '/public/img/pinol.png', 'ninios', '1', '1', 44, 0, '2020-02-21'),
(7, 13, 0, '0', 'Sabritas', 'Botana', '/public/img/sabritas.png', 'caballero', '1', '1', 12, 1, '2020-02-20'),
(8, 14, 0, '0', 'Axion', 'Limpieza', '/public/img/axion.png', 'ninios', '1', '1', 12, 0, '2020-02-20'),
(9, 35, 0, '0', 'Clorox 1lt', 'Limpieza', '/public/img/clorox.png', 'ninios', '1', '1', 9, 0, '2020-02-20'),
(10, 0, NULL, '0', 'Ajo 1pz', 'Verdura', '/public/img/ajo.png', 'bebes', '1', '0', 22, 0, '2020-02-22'),
(11, 4, NULL, '0', 'Elote 1pz', 'Verdura', '/public/img/elote.png', 'bebes', '1', '1', 22, 0, '2020-02-22'),
(12, 10, NULL, '0', 'Brocoli', 'Verdura', '/public/img/brocoli.png', 'bebes', '1', '0', 9, 0, '2020-02-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarioId` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol` enum('ADMIN','USER') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USER',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 - Inactivo, 1 - Activo',
  `ultimoIngreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuarioId`, `nombre`, `correo`, `password`, `direccion`, `telefono`, `rol`, `status`, `ultimoIngreso`, `fechaRegistro`) VALUES
(51, 'Kevin Valdez Zamora', 'delalozedo11@gmail.com', '$2y$04$zFuaSIjzS0F53/xYmieHNuGydXVDCSRZzYTdwGJrTozapcY4MzOtW', NULL, NULL, 'USER', '1', '2021-05-29 22:22:26', '2021-05-29 22:22:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compraDetalle`
--
ALTER TABLE `compraDetalle`
  ADD PRIMARY KEY (`detalleId`),
  ADD KEY `fk_compraId` (`compraId`),
  ADD KEY `fk_productoId` (`productoId`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`compraId`),
  ADD KEY `fk_usuarioId` (`usuarioId`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productoId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarioId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compraDetalle`
--
ALTER TABLE `compraDetalle`
  MODIFY `detalleId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `compraId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productoId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compraDetalle`
--
ALTER TABLE `compraDetalle`
  ADD CONSTRAINT `compraDetalle_ibfk_1` FOREIGN KEY (`compraId`) REFERENCES `compras` (`compraId`),
  ADD CONSTRAINT `compraDetalle_ibfk_2` FOREIGN KEY (`productoId`) REFERENCES `productos` (`productoId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
