-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2023 a las 16:16:51
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
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `codigo` varchar(30) DEFAULT NULL,
  `metodo` varchar(30) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `valido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `codigo`, `metodo`, `fecha`, `valido`) VALUES
(73, 'wxDI5UA6nv', 'Efectivo', '13/07/2023', 1),
(74, 'TvzjBg7mVK', 'Yape', '14/07/2023', 1);

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
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fnacimiento` varchar(11) DEFAULT NULL,
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
(230002, 'Santiago Robert', 'Lopez', 'Monroy', '12345678', 'santi@gmail.com', '12345', '123', '2000-10-19', 'tarde', 'lun mar ', 1, 2, 2, 'Asoc. Murillo N 1500 Cayma', 'Sachaca'),
(230003, 'Sander Josue', 'Rivas', 'Villa', '72713320', 'san@gmail.com', '912876456', '12', '2002-01-13', 'noche', 'lun mar mier jue vie', 1, 3, 4, 'Urb. ', 'NULL'),
(230004, 'Luis Miguel', 'Mansilla', 'Gutierrez', '12345678', 'guti@gmail.com', '123456789', '1234', '2023-06-04', NULL, NULL, 1, 4, NULL, 'av', 'Cercado'),
(230005, 'Dario Manuel', 'Salas', 'Paredes', '123', 'dsalas@gmail.com', '12345678', '123', NULL, 'noche', 'lun mar mier jue', 1, 2, 1, 'au', 'Cerro Colorado'),
(230006, 'Tomas', 'Torre', 'Peña', NULL, 'tom@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Yanahuara'),
(230007, 'Josh', 'Volgen', '', NULL, 'jolgendum@gmail.com', NULL, 'josh', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Cayma'),
(230008, 'Martin', 'Vilca', 'Lopez', NULL, 'martin@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Cerro Colorado'),
(230009, 'Denis Martin', 'Zambrano', 'Mollo', NULL, 'denis@gmail.com', NULL, '1234', NULL, NULL, NULL, 0, 4, NULL, NULL, 'Yura'),
(230010, 'Raul', 'Galindo', 'Meza', NULL, 'raul@gmail.com', NULL, '1234', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Mariano Melgar'),
(230011, 'Carlos', 'Chavez', 'Ferriño', NULL, 'carlos.ch@gmail.com', NULL, '123', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Uchumayo'),
(230012, 'Vladislav', 'Volgen', 'Dumkof', NULL, 'vlad@gmail.com', NULL, 'asd', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Characato'),
(230013, 'Lola', 'Chuctaya', 'Colca', NULL, 'lola@gmail.com', NULL, 'lola', NULL, NULL, NULL, 1, 4, NULL, NULL, 'Mollevalla'),
(230014, 'Jorge Luis', 'Choquehuanca', 'Zapata', '12345678', 'jorge@gmail.com', '123456789', 'jorge', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL),
(230015, 'Diego', 'Sanchez', 'Zavala', '12345678', 'diego@gmail.com', '123456789', '123', '1990-02-13', NULL, NULL, 1, 4, NULL, NULL, NULL),
(230016, 'Anthony', 'Brown', 'Mally', '12345678', 'anthon@gmail.com', '123456789', '123', '2023-06-06', NULL, NULL, 1, 4, NULL, 'av. jalisco', 'Cerro Colorado'),
(230017, 'Josue m', 'Tito', 'Mejia', '12345678', 'tito@gmail.com', '123456789', '123', NULL, 'noche', 'lun mar mier jue vie', 1, 1, 3, 'av.san', 'Selva Alegre'),
(230018, 'Denis Luis', 'Volgen', 'Paredes', '12345678', 'dluis@gmail.com', '969988482', '1234', NULL, 'NULL', 'lun mar mier jue vie', 1, 3, 3, 'av. jalisco', 'Selva Alegre'),
(230019, 'John Manuel', 'Gray', 'Mauricio', '7123456', 'john@gmail.com', '12', '12345', NULL, 'tarde', 'lun mar mier jue vie', 1, 3, 3, 'av', 'Cayma'),
(230020, 'Max', 'Lopez', 'Martinez', '12345678', 'max@gmail.com', '969988482', '12345', '2023-06-30', NULL, NULL, 1, 4, NULL, 'av. jalisco', 'Selva Alegre'),
(230021, 'Gaspi', 'Forware', '', '12345678', 'gaspi@outlook.com', '1234', '12', NULL, '', 'lun mar ', 0, 2, 0, NULL, NULL),
(230022, 'William', 'Huamani', 'Salas', '12', 'w@gmail.com', '12345678', 'will', '2023-06-07', NULL, NULL, 1, 4, NULL, '', 'Selva Alegre'),
(230023, 'Ghost', 'Matinez', '', '12345678', 'ghost@gmail.com', '12345678', 'ghost', '2023-06-07', '', 'lun mar ', 1, 1, 0, NULL, NULL),
(230024, 'Gus', 'Monroy', '', '12345678', 'gus@gmail.com', '12345678', 'gus', '2023-06-07', '', 'lun mar ', 1, 2, 0, NULL, NULL),
(230025, 'Penny', 'Macedo', 'Gutierrez', '12345678', 'pmacedo@gmail.com', '12345678', 'penny', '2023-06-07', 'noche', 'lun mar mier', 1, 3, 3, 'asoc', 'Cerro Colorado'),
(230026, 'Matias', 'Godoy', '', '12345678', 'mat@gmail.com', '12345678', 'mat', '2023-06-07', '', '', 1, 4, 0, NULL, NULL),
(230027, 'Aquiles', 'Castro', 'Caceres', '12345678', 'aquiles@gmail.com', '12345678', 'aquiles', '2023-06-07', 'noche', 'lun mar mier jue vie', 1, 3, 1, 'xd', 'Hunter'),
(230028, 'Zack', 'Morrys', '', '12345678', 'morrys@gmail.com', '12345678', 'zack', '2023-06-07', '', '', 1, 4, 0, NULL, NULL),
(230029, 'Mark', 'Gray', '', '12345678', 'mark@gmail.com', '12345678', '123456', '2023-06-07', '', 'lun mar ', 1, 1, 1, NULL, NULL),
(230030, 'Mario Samuel', 'Gomez', 'Peralta', '71650001', 'mariogomez@gmail.com', '969988482', '12345678', '2023-06-20', 'maÃ±ana', 'lun mar mier', 1, 2, 1, 'av', NULL),
(230042, 'Joaquin Lois', 'Sarmiento', 'Paredes', '12345678', 'joaquin@gmail.com', '969988482', '123', NULL, 'noche', 'lun mar mier jue', 1, 1, 1, 'av. jalisco 123', 'Mariano Melgar'),
(230043, 'Vladimir Sergy', 'Buen', 'Dia', '12345678', 'vlad@gmail.com', '969988482', '123', NULL, 'tarde', 'lun mar mier jue vie', 1, 1, 2, 'av. jalisco', 'Cayma'),
(230044, 'Fredy', 'Ozorio', 'Noel', '12345678', 'fred@gmail.com', '123456789', '123', '', NULL, NULL, 1, 4, NULL, 'av', 'Cercado'),
(230045, 'Pepe', 'carlos', 'fernn', '12345678', 'carlos1@gmail.com', '', '123', '2023-06-05', NULL, NULL, 1, 4, NULL, '', 'Cayma'),
(230046, 'Joel Angel', 'Quispe', 'Zarmiento', '12345678', 'joel@gmail.com', '12345678', '12', '2023-06-05', NULL, NULL, 1, 4, NULL, 'av', 'Cayma'),
(230047, 'Danny', 'Volgen', 'Paredes', '12345678', 'denny@gmail.com', '969988482', '123', '2023-06-27', NULL, NULL, 1, 4, NULL, '', 'Cercado'),
(230048, 'Danny', 'Volgen', 'Paredes', '12345678', 'denny@gmail.com', '969988482', '123', '2023-06-27', NULL, NULL, 1, 4, NULL, '', 'Cercado'),
(230050, 'Maricielo', 'cardenas', 'montalvo', '12345678', 'maricielo@gmail.com', '969988482', '12345', '2023-07-11', NULL, NULL, 1, 4, NULL, 'av', 'Cayma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idtecnico` int(11) DEFAULT NULL,
  `idpago` int(11) NOT NULL,
  `freserva` varchar(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idreserva`, `idcliente`, `idtecnico`, `idpago`, `freserva`, `monto`, `estado`) VALUES
(25, 230009, 230003, 73, '2023-07-16', 360, 1),
(26, 230007, 230003, 74, '2023-07-15', 240, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaservicio`
--

CREATE TABLE `reservaservicio` (
  `iddetalle` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `idreserva` int(11) NOT NULL,
  `npersonas` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaservicio`
--

INSERT INTO `reservaservicio` (`iddetalle`, `idservicio`, `idreserva`, `npersonas`, `subtotal`, `total`) VALUES
(27, 3, 25, 3, 50, 150),
(28, 5, 25, 3, 70, 210),
(29, 1, 26, 2, 60, 120),
(30, 2, 26, 2, 60, 120);

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
(1, 'Masaje Sueco', 'Esta técnica es la más popular de los tipos de masajes que existen, se basa en aplicar una serie de movimientos particulares como el tapotement, fricción, petrissage, percusión, effleurage, nudillares y espirales.', 'mañana', 60, 1, 'choc.jpg', 0, '3'),
(2, 'Masaje Thai', 'Un método milenario a través del cual se aplica presión y diferentes maniobras en los puntos donde se cruzan las líneas de energía del cuerpo, incluidas las palmas de las manos, brazos, codos y pies. Antes de comenzar con el masaje, se realiza una serie de ejercicios de estiramientos similares a los', 'tarde', 60, 1, 'masaje3.jpg', 1, '2'),
(3, 'Exfoliacion Facial', 'algo mas xd uwu', 'mañana', 50, 2, 'exfo.jpg', 1, '02:00'),
(4, 'Exfoliacion', 'algo', 'tarde', 120, 3, 'masaje3.jpg', 1, '03:17'),
(5, 'Masaje Bruh', 'algo sobre masaje', 'tarde', 70, 1, 'masaje4.jpg', 1, '01:30');

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
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idrol` (`idrol`),
  ADD KEY `idespecialidad` (`idespecialidad`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idpago` (`idpago`);

--
-- Indices de la tabla `reservaservicio`
--
ALTER TABLE `reservaservicio`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `idservicio` (`idservicio`),
  ADD KEY `idreserva` (`idreserva`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idservicio`),
  ADD KEY `idtipo` (`idtipo`);

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
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230051;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `reservaservicio`
--
ALTER TABLE `reservaservicio`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idservicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservaservicio`
--
ALTER TABLE `reservaservicio`
  ADD CONSTRAINT `reservaservicio_ibfk_1` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservaservicio_ibfk_2` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
