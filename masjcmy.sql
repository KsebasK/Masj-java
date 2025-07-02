-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2025 a las 06:31:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `masjcmy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquilerparqueadero`
--

CREATE TABLE `alquilerparqueadero` (
  `idAlquilerParqueadero` int(11) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `FechaSalida` date DEFAULT NULL,
  `TotalPago` int(11) DEFAULT NULL,
  `idBahia` int(11) NOT NULL,
  `idVisitante` int(11) NOT NULL,
  `idGuardia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquilerzonascomunes`
--

CREATE TABLE `alquilerzonascomunes` (
  `idAlquilerZonaComun` int(11) NOT NULL,
  `FechaAlquiler` date NOT NULL,
  `CantidadPersonas` int(11) DEFAULT NULL,
  `TotalPago` int(11) NOT NULL,
  `HoraLimite` datetime NOT NULL,
  `idZonaComun` int(11) NOT NULL,
  `idResidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamentos`
--

CREATE TABLE `apartamentos` (
  `idApartamentos` int(11) NOT NULL,
  `torre` varchar(10) NOT NULL,
  `apto` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `apartamentos`
--

INSERT INTO `apartamentos` (`idApartamentos`, `torre`, `apto`) VALUES
(1, '1', '204'),
(2, '2', '222'),
(3, '1', '222'),
(4, '2', '221'),
(5, '', ''),
(6, '7', '104'),
(7, '1', '205'),
(8, '', '1212'),
(9, '2', '200'),
(10, '7', '204'),
(11, '1', '1204');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parqueadero`
--

CREATE TABLE `parqueadero` (
  `idBahia` int(11) NOT NULL,
  `FechaEntrada` date DEFAULT NULL,
  `FechaSalida` date DEFAULT NULL,
  `Novedad` text DEFAULT NULL,
  `Estado` enum('Ocupado','Desocupado') NOT NULL DEFAULT 'Desocupado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parqueadero`
--

INSERT INTO `parqueadero` (`idBahia`, `FechaEntrada`, `FechaSalida`, `Novedad`, `Estado`) VALUES
(1, NULL, NULL, 'Ninguna', 'Desocupado'),
(2, NULL, NULL, 'Ninguna', 'Desocupado'),
(3, NULL, NULL, 'Ninguna', 'Desocupado'),
(4, NULL, NULL, 'Ninguna', 'Desocupado'),
(5, NULL, NULL, 'Ninguna', 'Desocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quejas`
--

CREATE TABLE `quejas` (
  `idQueja` int(11) NOT NULL,
  `FechaQueja` date NOT NULL,
  `MotivoQueja` text NOT NULL,
  `idResidente` int(11) NOT NULL,
  `estadoQueja` varchar(20) DEFAULT NULL,
  `idAdministrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `quejas`
--

INSERT INTO `quejas` (`idQueja`, `FechaQueja`, `MotivoQueja`, `idResidente`, `estadoQueja`, `idAdministrador`) VALUES
(2, '2025-07-01', 'Ruido excesivo en el piso 3 durante la noche', 7, 'PENDIENTE', 4),
(3, '2025-07-01', 'Fuga de agua en el ba?o del apartamento 201', 7, 'PENDIENTE', 4),
(5, '2025-07-01', 'Fugas de agua en el parqueadero subterr?neo', 7, 'SIN SOLUCI?N', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residentes`
--

CREATE TABLE `residentes` (
  `idResidente` int(11) NOT NULL,
  `idApartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `residentes`
--

INSERT INTO `residentes` (`idResidente`, `idApartamento`) VALUES
(15, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 6),
(11, 7),
(12, 8),
(13, 9),
(14, 10),
(16, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `PrimerNombre` varchar(25) NOT NULL,
  `SegundoNombre` varchar(25) DEFAULT NULL,
  `PrimerApellido` varchar(25) NOT NULL,
  `SegundoApellido` varchar(30) DEFAULT NULL,
  `NumeroCelular` varchar(15) NOT NULL,
  `CorreoElectronico` varchar(40) NOT NULL,
  `Contrasena` varchar(64) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `rol` enum('arrendatario','guardia','administrador','inactivo') DEFAULT NULL,
  `TipoDocumento` varchar(10) NOT NULL,
  `NumDocumento` int(11) NOT NULL,
  `idApartamentos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `NumeroCelular`, `CorreoElectronico`, `Contrasena`, `FechaNacimiento`, `rol`, `TipoDocumento`, `NumDocumento`, `idApartamentos`) VALUES
(3, 'andres', '', 'BernalH', '', '3208444444', 'sebas@gmail.com', '8d969eef6ecad3c29a3a629280e686cff8ca7f6c2f6d2f7f9d5f3c1a2d4c6f8d', '2006-07-28', 'guardia', 'CC', 1234567089, 5),
(4, 'karen', '', 'guzman', 'soto', '3208444442', 'karen@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2006-07-28', 'administrador', 'CC', 1234567089, 1),
(5, 'karen', '', 'guzman', 'sotico', '3208454442', 'sebasasda@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2006-07-28', 'inactivo', 'CC', 1023456789, 1),
(6, 'prueba', 'sebastian', 'guzman', 'holguin', '3208444262', 'sebas1@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2006-07-28', 'administrador', 'CC', 1234567894, 5),
(7, 'prueba', 'sebastian', 'guzman', 'sotico', '3208444454', 'sebas12@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2006-07-28', 'arrendatario', 'cedula', 1234567894, 2),
(8, 'andresB', 'sebastian', 'guzman', 'sotico', '3208444454', 'sebasasda@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2000-07-28', 'guardia', 'cedula', 1234567894, 3),
(9, 'tatiana', 'sebastian', 'guzman', 'sotico', '3208444454', 'karen2@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2006-07-28', 'arrendatario', 'cedula', 1023456789, 4),
(10, 'midry', '', 'gordo', '', '3121212121', 'gordo@gmail.com', 'e63c0ce90c0c1edf0bfc88aae8ed3193add40981837ef5872bac207cfaa0295a', '2000-06-06', 'arrendatario', 'cedula', 987543210, 6),
(11, 'sebas', 'Bernal', 'bernal', '', '3121212320', '1sebas@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2006-07-28', 'administrador', 'cedula', 1234567089, 7),
(12, 'prueba', '', 'guzman', 'holguin', '3208444442', '1sebas1@gmail.com', '79c179de51410f6a3c2691a3523df745cda9b75d0797c92c4536be513f745006', '2006-07-28', 'arrendatario', 'cedula', 1234567089, 8),
(13, 'prueba', 'Bernal', 'guzman', 'sotico', '3121212121', 'karen12@gmail.com', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '2006-07-28', 'arrendatario', 'cedula', 987543210, 9),
(14, 'sebastianB', 'sebastian', 'guzman', 'sotico', '3121212121', 'sebasasda@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', '2006-01-28', 'arrendatario', 'cedula', 1234567894, 10),
(15, 'karen', 'sebastian', 'bernal', 'holguin', '3121212121', 'pruebac@gmail.com', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '2006-07-28', 'arrendatario', 'cedula', 1234567899, 1),
(16, 'sebastianB', 'sebastian', 'BernalH', 'sotico', '3208444454', 'sebas111@gmail.com', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '2006-07-28', 'arrendatario', 'cedula', 1234567894, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `IDVEHICULO` int(11) NOT NULL,
  `HORA_INGRESO` datetime DEFAULT NULL,
  `HORA_SALIDA` datetime DEFAULT NULL,
  `MARCAVEHICULO` varchar(255) DEFAULT NULL,
  `MODELOVEHICULO` varchar(255) DEFAULT NULL,
  `PLACAVEHICULO` varchar(255) DEFAULT NULL,
  `VALOR_PAGADO` int(11) DEFAULT NULL,
  `idBahia` int(11) DEFAULT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `idVisitante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `idVehiculo` int(11) NOT NULL,
  `PlacaVehiculo` varchar(6) NOT NULL,
  `MarcaVehiculo` varchar(15) DEFAULT NULL,
  `ModeloVehiculo` varchar(25) DEFAULT NULL,
  `idBahia` int(11) NOT NULL,
  `idResidente` int(11) NOT NULL,
  `idVisitante` int(11) DEFAULT NULL,
  `hora_ingreso` timestamp NULL DEFAULT NULL,
  `hora_salida` timestamp NULL DEFAULT NULL,
  `valor_pagado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `idVisitante` int(11) NOT NULL,
  `NombresVisitante` varchar(40) NOT NULL,
  `ApellidosVisitante` varchar(40) NOT NULL,
  `TipoDocumento` varchar(10) NOT NULL,
  `NumDocumento` int(11) NOT NULL,
  `idGuardia` int(11) NOT NULL,
  `idApartamento` int(11) NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`idVisitante`, `NombresVisitante`, `ApellidosVisitante`, `TipoDocumento`, `NumDocumento`, `idGuardia`, `idApartamento`, `hora_entrada`, `hora_salida`) VALUES
(1, 'sebastian', 'bernal holguin', 'CC', 1234567890, 8, 1, '23:48:35', NULL),
(2, 'sebastian', 'bernal holguin', 'CC', 123456789, 8, 1, '04:12:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonacomun`
--

CREATE TABLE `zonacomun` (
  `idZonaComun` int(11) NOT NULL,
  `TipoZona` varchar(25) NOT NULL,
  `EstadoZona` enum('Disponible','Ocupada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquilerparqueadero`
--
ALTER TABLE `alquilerparqueadero`
  ADD PRIMARY KEY (`idAlquilerParqueadero`),
  ADD KEY `idBahia` (`idBahia`),
  ADD KEY `idVisitante` (`idVisitante`),
  ADD KEY `idGuardia` (`idGuardia`);

--
-- Indices de la tabla `alquilerzonascomunes`
--
ALTER TABLE `alquilerzonascomunes`
  ADD PRIMARY KEY (`idAlquilerZonaComun`),
  ADD KEY `idZonaComun` (`idZonaComun`),
  ADD KEY `idResidente` (`idResidente`);

--
-- Indices de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD PRIMARY KEY (`idApartamentos`);

--
-- Indices de la tabla `parqueadero`
--
ALTER TABLE `parqueadero`
  ADD PRIMARY KEY (`idBahia`);

--
-- Indices de la tabla `quejas`
--
ALTER TABLE `quejas`
  ADD PRIMARY KEY (`idQueja`),
  ADD KEY `idResidente` (`idResidente`),
  ADD KEY `idAdministrador` (`idAdministrador`);

--
-- Indices de la tabla `residentes`
--
ALTER TABLE `residentes`
  ADD PRIMARY KEY (`idResidente`),
  ADD KEY `idApartamento` (`idApartamento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`IDVEHICULO`),
  ADD KEY `FK_VEHICULO_idVisitante` (`idVisitante`),
  ADD KEY `FK_VEHICULO_idBahia` (`idBahia`),
  ADD KEY `FK_VEHICULO_idResidente` (`idResidente`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD KEY `idBahia` (`idBahia`),
  ADD KEY `idResidente` (`idResidente`),
  ADD KEY `idVisitante` (`idVisitante`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`idVisitante`),
  ADD KEY `idGuardia` (`idGuardia`),
  ADD KEY `idApartamento` (`idApartamento`);

--
-- Indices de la tabla `zonacomun`
--
ALTER TABLE `zonacomun`
  ADD PRIMARY KEY (`idZonaComun`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquilerparqueadero`
--
ALTER TABLE `alquilerparqueadero`
  MODIFY `idAlquilerParqueadero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alquilerzonascomunes`
--
ALTER TABLE `alquilerzonascomunes`
  MODIFY `idAlquilerZonaComun` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  MODIFY `idApartamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `parqueadero`
--
ALTER TABLE `parqueadero`
  MODIFY `idBahia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `quejas`
--
ALTER TABLE `quejas`
  MODIFY `idQueja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `IDVEHICULO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitante`
--
ALTER TABLE `visitante`
  MODIFY `idVisitante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `zonacomun`
--
ALTER TABLE `zonacomun`
  MODIFY `idZonaComun` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquilerparqueadero`
--
ALTER TABLE `alquilerparqueadero`
  ADD CONSTRAINT `alquilerparqueadero_ibfk_1` FOREIGN KEY (`idBahia`) REFERENCES `parqueadero` (`idBahia`),
  ADD CONSTRAINT `alquilerparqueadero_ibfk_2` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`),
  ADD CONSTRAINT `alquilerparqueadero_ibfk_3` FOREIGN KEY (`idGuardia`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `alquilerzonascomunes`
--
ALTER TABLE `alquilerzonascomunes`
  ADD CONSTRAINT `alquilerzonascomunes_ibfk_1` FOREIGN KEY (`idZonaComun`) REFERENCES `zonacomun` (`idZonaComun`),
  ADD CONSTRAINT `alquilerzonascomunes_ibfk_2` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`);

--
-- Filtros para la tabla `quejas`
--
ALTER TABLE `quejas`
  ADD CONSTRAINT `quejas_ibfk_1` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`),
  ADD CONSTRAINT `quejas_ibfk_2` FOREIGN KEY (`idAdministrador`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `residentes`
--
ALTER TABLE `residentes`
  ADD CONSTRAINT `residentes_ibfk_1` FOREIGN KEY (`idResidente`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `residentes_ibfk_2` FOREIGN KEY (`idApartamento`) REFERENCES `apartamentos` (`idApartamentos`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK_VEHICULO_idBahia` FOREIGN KEY (`idBahia`) REFERENCES `parqueadero` (`idBahia`),
  ADD CONSTRAINT `FK_VEHICULO_idResidente` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`),
  ADD CONSTRAINT `FK_VEHICULO_idVisitante` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`idBahia`) REFERENCES `parqueadero` (`idBahia`),
  ADD CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`),
  ADD CONSTRAINT `vehiculos_ibfk_3` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`);

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `visitante_ibfk_2` FOREIGN KEY (`idGuardia`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `visitante_ibfk_3` FOREIGN KEY (`idApartamento`) REFERENCES `apartamentos` (`idApartamentos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
