-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2023 a las 16:50:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spautp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idespecialidad` int(11) NOT NULL,
  `nomespecial` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idespecialidad`, `nomespecial`) VALUES
(1, 'Masajista'),
(2, 'Esteticistas'),
(3, 'Terapeuta'),
(4, 'Fisioterapeuta'),
(5, 'cas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `codigo` int(11) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `apelpat` varchar(50) NOT NULL,
  `apelmat` varchar(50) DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fnacimiento` date DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `horario` varchar(20) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idespecialidad` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `distrito` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`codigo`, `nombres`, `apelpat`, `apelmat`, `dni`, `correo`, `telefono`, `contrasena`, `fnacimiento`, `turno`, `horario`, `estado`, `idrol`, `idespecialidad`, `direccion`, `distrito`) VALUES
(230001, 'Carlos Alfredo', 'Choquehuanca', 'Chuctaya', '71650006', 'carlos@gmail.com', '969988482', '123', '2001-10-15', 'mañana', 'lun mar mier jue vie', 1, 1, 1, 'Auis. Las MAlvinas', 'Cayma'),
(230002, 'Santiago', 'Lopez', 'Monroy', '12345678', 'santi@gmail.com', '12345', '123', '2000-10-19', 'tarde', 'lun mar ', 0, 2, 2, 'Asoc. Murillo N 1500 Cayma', 'Sachaca'),
(230003, 'Samuel Angelo', 'Gomez', 'Rivera', '72614470', 'sam@gmail.com', '12345', 'admin', '2002-01-13', 'mañana', 'lun mar mier jue vie', 1, 1, 1, 'Urb. Continental Mz. O Lt.', 'Cerro Colorado'),
(230004, 'Luis', 'Mansilla', 'Gutierrez', '1234', 'guti@gmail.com', NULL, '1234', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(230005, 'Dan', 'Salas', 'Paredes', '123', 'dan@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL),
(230006, 'Denis', 'Salas', 'Paredes', NULL, 'denis@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230007, 'Josh', 'Volgen', '', NULL, 'jolgendum@gmail.com', NULL, 'josh', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230008, 'Martin', 'Volgen', 'Lopez', NULL, 'martin@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230009, 'Denis', 'Salas', 'Paredes', NULL, 'deni@gmail.com', NULL, '1234', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230010, 'Denis', 'Salas', 'Paredes', NULL, 'deni@gmail.com', NULL, '1234', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230011, 'Carlos', 'Chavez', 'Paredes', NULL, 'carlos.ch@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230012, 'Josh', 'Volgen', 'Paredes', NULL, 'alf@gmail.com', NULL, 'asd', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `codCliente` int(11) NOT NULL,
  `idreservaservicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaservicio`
--

CREATE TABLE `reservaservicio` (
  `id` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nomrol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nomrol`) VALUES
(1, 'Administrador'),
(2, 'Encargado'),
(3, 'Técnico'),
(4, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idservicio` int(11) NOT NULL,
  `nomserv` varchar(40) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `estadoserv` int(11) NOT NULL,
  `duracion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idservicio`, `nomserv`, `descripcion`, `turno`, `precio`, `idtipo`, `imagen`, `estadoserv`, `duracion`) VALUES
(1, 'Masaje Sueco', 'Esta técnica es la más popular de los tipos de masajes que existen, se basa en aplicar una serie de movimientos particulares como el tapotement, fricción, petrissage, percusión, effleurage, nudillares y espirales.', 'mañana', 60, 1, 'choc.jpg', 1, '3 h'),
(2, 'Masaje Thai', 'Un método milenario a través del cual se aplica presión y diferentes maniobras en los puntos donde se cruzan las líneas de energía del cuerpo, incluidas las palmas de las manos, brazos, codos y pies. Antes de comenzar con el masaje, se realiza una serie de ejercicios de estiramientos similares a los', 'tarde', 60, 1, 'masaje3.jpg', 1, '2 h');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idtipo` int(11) NOT NULL,
  `nomtipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idtipo`, `nomtipo`) VALUES
(1, 'Masaje'),
(2, 'Exfoliación'),
(3, 'Mascarilla'),
(4, 'Terapia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idespecialidad`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`);

--
-- Indices de la tabla `reservaservicio`
--
ALTER TABLE `reservaservicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idservicio`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idtipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idespecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230013;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservaservicio`
--
ALTER TABLE `reservaservicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idservicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
