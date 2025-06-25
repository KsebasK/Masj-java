-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2025 a las 03:46:07
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
-- Base de datos: `masj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `IDADMINISTRADOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `idAdministrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquilerparqueadero`
--

CREATE TABLE `alquilerparqueadero` (
  `idAlquilerParqueadero` int(11) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `FechaSalida` date NOT NULL,
  `TotalPago` int(11) NOT NULL,
  `idBahia` int(11) NOT NULL,
  `idVisitante` int(11) NOT NULL,
  `idGuardia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamentos`
--

CREATE TABLE `apartamentos` (
  `idApartamentos` int(11) NOT NULL,
  `torre` varchar(10) NOT NULL,
  `apto` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `apartamentos`
--

INSERT INTO `apartamentos` (`idApartamentos`, `torre`, `apto`) VALUES
(1, 'Torre 1', 'A1'),
(2, 'Torre 1', 'A2'),
(3, 'Torre 2', 'B1'),
(4, 'Torre 2', 'B2'),
(5, 'Torre 3', 'C1'),
(6, 'Torre 3', 'C2'),
(7, 'Torre 1', 'D1'),
(8, 'Torre 1', 'D2'),
(9, 'Torre 2', 'E1'),
(10, 'Torre 2', 'E2'),
(11, 'Torre 3', 'F1'),
(12, 'Torre 3', 'F2'),
(13, 'Torre 1', 'G1'),
(14, 'Torre 1', 'G2'),
(15, 'Torre 2', 'H1'),
(16, 'Torre 2', 'H2'),
(17, 'Torre 3', 'I1'),
(18, 'Torre 3', 'I2'),
(19, 'Torre 1', 'J1'),
(20, 'Torre 1', 'J2'),
(21, 'Torre 2', 'K1'),
(22, 'Torre 2', 'K2'),
(23, 'Torre 3', 'L1'),
(24, 'Torre 3', 'L2'),
(25, 'Torre 1', 'M1'),
(26, 'Torre 1', 'M2'),
(27, 'Torre 2', 'N1'),
(28, 'Torre 2', 'N2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjunto`
--

CREATE TABLE `conjunto` (
  `NomConjunto` varchar(25) NOT NULL,
  `Direccion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `conjunto`
--

INSERT INTO `conjunto` (`NomConjunto`, `Direccion`) VALUES
('Conjunto Unico', 'Calle 100 # 123-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guardias`
--

CREATE TABLE `guardias` (
  `idGuardia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parqueadero`
--

CREATE TABLE `parqueadero` (
  `idBahia` int(11) NOT NULL,
  `FechaEntrada` date NOT NULL,
  `FechaSalida` date NOT NULL,
  `Novedad` text DEFAULT NULL,
  `Estado` enum('Ocupado','Desocupado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `parqueadero`
--

INSERT INTO `parqueadero` (`idBahia`, `FechaEntrada`, `FechaSalida`, `Novedad`, `Estado`) VALUES
(1, '2024-10-01', '2024-10-02', 'Ninguna', 'Ocupado'),
(2, '2024-10-02', '2024-10-03', 'Ninguna', 'Ocupado'),
(3, '2024-10-03', '2024-10-04', 'Ninguna', 'Desocupado'),
(4, '2024-10-04', '2024-10-05', 'Mantenimiento', 'Desocupado'),
(5, '2024-10-05', '2024-10-06', 'Ninguna', 'Ocupado'),
(6, '2024-10-06', '2024-10-07', 'Ninguna', 'Ocupado'),
(7, '2024-10-07', '2024-10-08', 'Ninguna', 'Ocupado'),
(8, '2024-10-08', '2024-10-09', 'Ninguna', 'Desocupado'),
(9, '2024-10-09', '2024-10-10', 'Ninguna', 'Ocupado'),
(10, '2024-10-10', '2024-10-11', 'Ninguna', 'Desocupado'),
(11, '2024-10-11', '2024-10-12', 'Ninguna', 'Ocupado'),
(12, '2024-10-12', '2024-10-13', 'Ninguna', 'Ocupado'),
(13, '2024-10-13', '2024-10-14', 'Ninguna', 'Ocupado'),
(14, '2024-10-14', '2024-10-15', 'Ninguna', 'Desocupado'),
(15, '2024-10-15', '2024-10-16', 'Ninguna', 'Ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quejas`
--

CREATE TABLE `quejas` (
  `idQueja` int(11) NOT NULL,
  `FechaQueja` date NOT NULL,
  `MotivoQueja` text NOT NULL,
  `idResidente` int(11) NOT NULL,
  `EstadoQueja` tinyint(4) NOT NULL,
  `idAdministrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residentes`
--

CREATE TABLE `residentes` (
  `idResidente` int(11) NOT NULL,
  `idApartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `ConjuntoNombre` varchar(25) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Estado` enum('activo','inactivo') NOT NULL,
  `Rol` enum('propietario','arrendatario','guardia','administrador') NOT NULL,
  `TipoDocumento` varchar(10) NOT NULL,
  `NumDocumento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `NumeroCelular`, `CorreoElectronico`, `Contrasena`, `ConjuntoNombre`, `FechaNacimiento`, `Estado`, `Rol`, `TipoDocumento`, `NumDocumento`) VALUES
(1, 'sebastianB', '1', 'BernalH', '', '3208444444', 'sebas@gmail.com', '123456', 'Conjunto Unico', '2006-07-28', 'activo', 'propietario', 'CC', 1234567089),
(3, 'karen', '1', 'BernalH', '', '3208444454', 'karen@gmail.com', '123456', 'Conjunto Unico', '2006-07-28', 'activo', 'guardia', 'CC', 1234567089);

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
  `idResidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`idVehiculo`, `PlacaVehiculo`, `MarcaVehiculo`, `ModeloVehiculo`, `idBahia`, `idResidente`) VALUES
(1, 'ABC123', 'Toyota', 'Corolla', 1, 1),
(2, 'XYZ789', 'Honda', 'Civic', 2, 2),
(3, 'LMN456', 'Chevrolet', 'Sonic', 5, 5),
(4, 'OPQ012', 'Nissan', 'Versa', 6, 6),
(5, 'RST345', 'Ford', 'Focus', 7, 7),
(6, 'UVW678', 'Hyundai', 'Elantra', 9, 15),
(7, 'JKL901', 'Kia', 'Rio', 11, 24),
(8, 'MNO234', 'Mazda', '3', 12, 32),
(9, 'DEF567', 'Subaru', 'Impreza', 13, 21),
(10, 'GHI890', 'Volkswagen', 'Jetta', 15, 16);

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
  `idResidente` int(11) NOT NULL,
  `idGuardia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`idVisitante`, `NombresVisitante`, `ApellidosVisitante`, `TipoDocumento`, `NumDocumento`, `idResidente`, `idGuardia`) VALUES
(1, 'Carlos', 'Mora', 'CC', 789123456, 1, 14),
(2, 'Sof?a', 'L?pez', 'CC', 456789123, 2, 28),
(3, 'Pedro', 'P?rez', 'CC', 234567891, 1, 14),
(4, 'Luis', 'G?mez', 'CC', 345678912, 22, 28),
(5, 'Natalia', 'Rinc?n', 'CC', 123456789, 24, 14),
(6, 'Diego', 'Sanchez', 'CC', 987654321, 29, 31),
(7, 'Maria', 'Castillo', 'CC', 456123789, 30, 31),
(8, 'Andr?s', 'Torres', 'CC', 321789654, 36, 31),
(9, 'Laura', 'Duarte', 'CC', 654123789, 35, 31),
(10, 'Cristian', 'Garc?a', 'CC', 1234567890, 2, 34),
(11, 'Felipe', 'Jim?nez', 'CC', 2147483647, 6, 38),
(12, 'Gabriela', 'Salazar', 'CC', 2147483647, 9, 38),
(13, 'Isabel', 'Hern?ndez', 'CC', 2147483647, 12, 38),
(14, 'Valentina', 'Mendoza', 'CC', 2147483647, 12, 14),
(15, 'Juli?n', 'Mart?nez', 'CC', 2147483647, 30, 14),
(16, 'Fernando', 'Acu?a', 'CC', 2147483647, 17, 28),
(17, 'Santiago', 'Rivas', 'CC', 2147483647, 20, 28),
(18, 'Camila', 'Cruz', 'CC', 2147483647, 7, 28),
(19, 'Mar?a', 'Alvarado', 'CC', 2147483647, 36, 38),
(20, 'Emilio', 'Salazar', 'CC', 2147483647, 26, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante_has_vehiculos`
--

CREATE TABLE `visitante_has_vehiculos` (
  `idVisitante` int(11) NOT NULL,
  `idVehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `visitante_has_vehiculos`
--

INSERT INTO `visitante_has_vehiculos` (`idVisitante`, `idVehiculo`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 5),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonacomun`
--

CREATE TABLE `zonacomun` (
  `idZonaComun` int(11) NOT NULL,
  `TipoZona` varchar(25) NOT NULL,
  `EstadoZona` enum('Disponible','Ocupada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `zonacomun`
--

INSERT INTO `zonacomun` (`idZonaComun`, `TipoZona`, `EstadoZona`) VALUES
(1, 'Piscina', 'Disponible'),
(2, 'Gimnasio', 'Ocupada'),
(3, 'Sal?n de Eventos', 'Disponible'),
(4, 'Zona Infantil', 'Ocupada'),
(5, 'Terraza', 'Disponible');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`IDADMINISTRADOR`);

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Indices de la tabla `alquilerparqueadero`
--
ALTER TABLE `alquilerparqueadero`
  ADD PRIMARY KEY (`idAlquilerParqueadero`),
  ADD KEY `fk_AlquilerParqueadero_Parqueadero1_idx` (`idBahia`),
  ADD KEY `fk_AlquilerParqueadero_Visitante1_idx` (`idVisitante`),
  ADD KEY `fk_AlquilerParqueadero_Guardias1_idx` (`idGuardia`);

--
-- Indices de la tabla `alquilerzonascomunes`
--
ALTER TABLE `alquilerzonascomunes`
  ADD PRIMARY KEY (`idAlquilerZonaComun`),
  ADD KEY `fk_AlquilerZonasComunes_ZonaComun1_idx` (`idZonaComun`),
  ADD KEY `fk_AlquilerZonasComunes_Residentes1_idx` (`idResidente`);

--
-- Indices de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD PRIMARY KEY (`idApartamentos`);

--
-- Indices de la tabla `conjunto`
--
ALTER TABLE `conjunto`
  ADD PRIMARY KEY (`NomConjunto`);

--
-- Indices de la tabla `guardias`
--
ALTER TABLE `guardias`
  ADD PRIMARY KEY (`idGuardia`);

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
  ADD KEY `fk_Quejas_Residentes1_idx` (`idResidente`),
  ADD KEY `fk_Quejas_Administradores1_idx` (`idAdministrador`);

--
-- Indices de la tabla `residentes`
--
ALTER TABLE `residentes`
  ADD PRIMARY KEY (`idResidente`),
  ADD KEY `fk_Residentes_Apartamentos` (`idApartamento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Conjunto1_idx` (`ConjuntoNombre`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD KEY `fk_Vehiculos_Parqueadero1_idx` (`idBahia`),
  ADD KEY `fk_Vehiculos_Residentes1_idx` (`idResidente`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`idVisitante`),
  ADD KEY `fk_Visitante_Residentes1_idx` (`idResidente`),
  ADD KEY `fk_Visitante_Guardias1_idx` (`idGuardia`);

--
-- Indices de la tabla `visitante_has_vehiculos`
--
ALTER TABLE `visitante_has_vehiculos`
  ADD PRIMARY KEY (`idVisitante`,`idVehiculo`),
  ADD KEY `fk_Visitante_has_Vehiculos_Vehiculos1` (`idVehiculo`);

--
-- Indices de la tabla `zonacomun`
--
ALTER TABLE `zonacomun`
  ADD PRIMARY KEY (`idZonaComun`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  MODIFY `idApartamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `FK_ADMINISTRADOR_IDADMINISTRADOR` FOREIGN KEY (`IDADMINISTRADOR`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `fk_Administradores_Usuario1` FOREIGN KEY (`idAdministrador`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `alquilerparqueadero`
--
ALTER TABLE `alquilerparqueadero`
  ADD CONSTRAINT `fk_AlquilerParqueadero_Guardias1` FOREIGN KEY (`idGuardia`) REFERENCES `guardias` (`idGuardia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AlquilerParqueadero_Parqueadero1` FOREIGN KEY (`idBahia`) REFERENCES `parqueadero` (`idBahia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AlquilerParqueadero_Visitante1` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alquilerzonascomunes`
--
ALTER TABLE `alquilerzonascomunes`
  ADD CONSTRAINT `fk_AlquilerZonasComunes_Residentes1` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AlquilerZonasComunes_ZonaComun1` FOREIGN KEY (`idZonaComun`) REFERENCES `zonacomun` (`idZonaComun`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `guardias`
--
ALTER TABLE `guardias`
  ADD CONSTRAINT `fk_Guardias_Usuario1` FOREIGN KEY (`idGuardia`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `quejas`
--
ALTER TABLE `quejas`
  ADD CONSTRAINT `fk_Quejas_Administradores1` FOREIGN KEY (`idAdministrador`) REFERENCES `administradores` (`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Quejas_Residentes1` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `residentes`
--
ALTER TABLE `residentes`
  ADD CONSTRAINT `fk_Residentes_Apartamentos` FOREIGN KEY (`idApartamento`) REFERENCES `apartamentos` (`idApartamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Conjunto1` FOREIGN KEY (`ConjuntoNombre`) REFERENCES `conjunto` (`NomConjunto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_Vehiculos_Parqueadero1` FOREIGN KEY (`idBahia`) REFERENCES `parqueadero` (`idBahia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vehiculos_Residentes1` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `fk_Visitante_Guardias1` FOREIGN KEY (`idGuardia`) REFERENCES `guardias` (`idGuardia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visitante_Residentes1` FOREIGN KEY (`idResidente`) REFERENCES `residentes` (`idResidente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `visitante_has_vehiculos`
--
ALTER TABLE `visitante_has_vehiculos`
  ADD CONSTRAINT `fk_Visitante_has_Vehiculos_Vehiculos1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculos` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visitante_has_Vehiculos_Visitante1` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
