-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2021 a las 22:19:11
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueadero_franco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_vehiculo`
--

CREATE TABLE `clase_vehiculo` (
  `idClaseVehiculo` int(11) NOT NULL,
  `tipoVehiculo` varchar(10) NOT NULL,
  `valorHora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `celular` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `idServicio` int(11) NOT NULL,
  `fk_vehiculo` int(11) NOT NULL,
  `horaEntrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `fk_servicio` int(11) NOT NULL,
  `valorTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `fk_clase_vehiculo` int(11) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase_vehiculo`
--
ALTER TABLE `clase_vehiculo`
  ADD PRIMARY KEY (`idClaseVehiculo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `fk_vehiculo` (`fk_vehiculo`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD KEY `fk_servicio` (`fk_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD KEY `fk_clase_vehiculo` (`fk_clase_vehiculo`),
  ADD KEY `fk_cliente` (`fk_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase_vehiculo`
--
ALTER TABLE `clase_vehiculo`
  MODIFY `idClaseVehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_vehiculo` FOREIGN KEY (`fk_vehiculo`) REFERENCES `vehiculo` (`idVehiculo`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `fk_servicio` FOREIGN KEY (`fk_servicio`) REFERENCES `entrada` (`idServicio`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_clase_vehiculo` FOREIGN KEY (`fk_clase_vehiculo`) REFERENCES `clase_vehiculo` (`idClaseVehiculo`),
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
