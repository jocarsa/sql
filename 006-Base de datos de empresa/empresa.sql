-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2024 a las 19:13:28
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Identificador` int(10) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `idfiscal` varchar(50) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `codigopostal` varchar(20) NOT NULL,
  `nombrepersonacontacto` varchar(250) NOT NULL,
  `emailpersonacontacto` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='En esta tabla guardaremos los clientes';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Identificador`, `nombre`, `idfiscal`, `direccion`, `codigopostal`, `nombrepersonacontacto`, `emailpersonacontacto`, `imagen`) VALUES
(3, 'Nombre de la empresa 1', 'C000001', 'Dirección de la empresa 1', '46001', 'Juan Lopez Martinez', 'juanlopez@empresa1.com', 'logoempresa1.jpg'),
(5, 'Nombre de la empresa 2', 'C000002', 'Dirección de la empresa 2', '46002', '', '', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalle_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalle_pedidos` (
`Número de pedido` int(10)
,`Fecha del pedido` date
,`Nombre del cliente` varchar(150)
,`Producto` varchar(150)
,`Precio` decimal(10,2)
,`Cantidad` int(10)
,`Subtotal` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaspedido`
--

CREATE TABLE `lineaspedido` (
  `Identificador` int(10) NOT NULL,
  `pedidos_fecha` int(10) NOT NULL,
  `productos_nombre` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineaspedido`
--

INSERT INTO `lineaspedido` (`Identificador`, `pedidos_fecha`, `productos_nombre`, `cantidad`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 2),
(3, 1, 3, 1),
(4, 3, 4, 2),
(5, 3, 5, 3),
(6, 3, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Identificador` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `clientes_nombre` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Identificador`, `fecha`, `clientes_nombre`) VALUES
(1, '2023-12-12', 3),
(3, '2023-12-22', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Identificador` int(10) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` enum('fisico','virtual') NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='En esta tabla guardaremos los productos';

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Identificador`, `nombre`, `descripcion`, `precio`, `categoria`, `peso`, `imagen`) VALUES
(1, 'Ratón', 'Ratón de ordenador', '15.50', 'fisico', '0.10', 'raton.jpg'),
(2, 'Teclado', 'Teclado de ordenador', '20.50', 'fisico', '0.20', 'teclado.jpg'),
(3, 'Monitor', 'Monitor de ordenador', '200.50', 'fisico', '2.00', 'monitor.jpg'),
(4, 'Curso de SQL', 'Curso de SQL paso a paso', '300.50', 'virtual', '0.00', 'cursosql.jpg'),
(5, 'Curso de PHP', 'Curso de PHP paso a paso', '200.50', 'virtual', '0.00', 'cursophp.jpg'),
(6, 'Curso de Python', 'Curso de Python paso a paso', '400.50', 'virtual', '0.00', 'cursopython.jpg');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `totales_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `totales_pedidos` (
`Número de pedido` int(10)
,`Fecha del pedido` date
,`Nombre del cliente` varchar(150)
,`Total` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Identificador` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `nombrepropio` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fotografia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='En esta tabla guardaremos los usuarios';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Identificador`, `nombre`, `contrasena`, `nombrepropio`, `apellidos`, `email`, `telefono`, `fotografia`) VALUES
(1, 'josevicente', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura para la vista `detalle_pedidos`
--
DROP TABLE IF EXISTS `detalle_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_pedidos`  AS SELECT `pedidos`.`Identificador` AS `Número de pedido`, `pedidos`.`fecha` AS `Fecha del pedido`, `clientes`.`nombre` AS `Nombre del cliente`, `productos`.`nombre` AS `Producto`, `productos`.`precio` AS `Precio`, `lineaspedido`.`cantidad` AS `Cantidad`, `productos`.`precio`* `lineaspedido`.`cantidad` AS `Subtotal` FROM (((`pedidos` left join `clientes` on(`pedidos`.`clientes_nombre` = `clientes`.`Identificador`)) left join `lineaspedido` on(`lineaspedido`.`pedidos_fecha` = `pedidos`.`Identificador`)) left join `productos` on(`lineaspedido`.`productos_nombre` = `productos`.`Identificador`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `totales_pedidos`
--
DROP TABLE IF EXISTS `totales_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totales_pedidos`  AS SELECT `pedidos`.`Identificador` AS `Número de pedido`, `pedidos`.`fecha` AS `Fecha del pedido`, `clientes`.`nombre` AS `Nombre del cliente`, sum(`productos`.`precio` * `lineaspedido`.`cantidad`) AS `Total` FROM (((`pedidos` left join `clientes` on(`pedidos`.`clientes_nombre` = `clientes`.`Identificador`)) left join `lineaspedido` on(`lineaspedido`.`pedidos_fecha` = `pedidos`.`Identificador`)) left join `productos` on(`lineaspedido`.`productos_nombre` = `productos`.`Identificador`)) GROUP BY `clientes`.`Identificador``Identificador`  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  ADD PRIMARY KEY (`Identificador`),
  ADD KEY `pedidos_fecha` (`pedidos_fecha`),
  ADD KEY `productos_nombre` (`productos_nombre`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Identificador`),
  ADD KEY `clientes_nombre` (`clientes_nombre`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Identificador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Identificador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  MODIFY `Identificador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Identificador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Identificador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Identificador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  ADD CONSTRAINT `lineaspedido_ibfk_1` FOREIGN KEY (`pedidos_fecha`) REFERENCES `pedidos` (`Identificador`),
  ADD CONSTRAINT `lineaspedido_ibfk_2` FOREIGN KEY (`productos_nombre`) REFERENCES `productos` (`Identificador`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`clientes_nombre`) REFERENCES `clientes` (`Identificador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
