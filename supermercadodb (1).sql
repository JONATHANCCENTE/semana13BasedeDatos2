-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2024 a las 05:24:32
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
-- Base de datos: `supermercadodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacensuper`
--

CREATE TABLE `almacensuper` (
  `codAlmacen` int(11) NOT NULL,
  `nombreAlmacen` varchar(100) NOT NULL,
  `codSupermercado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `codArea` int(11) NOT NULL,
  `nombreArea` varchar(50) NOT NULL,
  `codSupermercado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre`
--

CREATE TABLE `cierre` (
  `idCierre` int(11) NOT NULL,
  `codSupermercado` int(11) DEFAULT NULL,
  `fechaCierre` date NOT NULL,
  `totalVentas` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clavesclientes`
--

CREATE TABLE `clavesclientes` (
  `idClave` int(11) NOT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `clave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` varchar(20) NOT NULL,
  `nombreCliente` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientecorporativo`
--

CREATE TABLE `clientecorporativo` (
  `ruc` varchar(20) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallealmacensupermercado`
--

CREATE TABLE `detallealmacensupermercado` (
  `idDetalleAlmacenSuper` int(11) NOT NULL,
  `codAlmacen` int(11) DEFAULT NULL,
  `codProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallekardex`
--

CREATE TABLE `detallekardex` (
  `idDetalleKardex` int(11) NOT NULL,
  `numKardex` int(11) DEFAULT NULL,
  `codProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleproducto`
--

CREATE TABLE `detalleproducto` (
  `CodDetalleP` int(11) NOT NULL,
  `codProducto` int(11) DEFAULT NULL,
  `codTamaño` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `numVenta` int(11) DEFAULT NULL,
  `codProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentoentrega`
--

CREATE TABLE `documentoentrega` (
  `codEntrega` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `codEmp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentoventa`
--

CREATE TABLE `documentoventa` (
  `numVenta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `codEmp` int(11) DEFAULT NULL,
  `codSupermercado` int(11) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `codEmp` int(11) NOT NULL,
  `nombreEmpleado` varchar(100) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `codSupermercado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `codEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `numKardex` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` enum('Entrada','Salida') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `codMarca` int(11) NOT NULL,
  `nombreMarca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeracion`
--

CREATE TABLE `numeracion` (
  `idNumeracion` int(11) NOT NULL,
  `codSupermercado` int(11) DEFAULT NULL,
  `serie` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE `precio` (
  `numPrecio` int(11) NOT NULL,
  `CodDetalleP` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preciotempo`
--

CREATE TABLE `preciotempo` (
  `idPrecioTempo` int(11) NOT NULL,
  `numPrecio` int(11) DEFAULT NULL,
  `codTemp` int(11) DEFAULT NULL,
  `precioTemporal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codProducto` int(11) NOT NULL,
  `nombreProducto` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `codMarca` int(11) DEFAULT NULL,
  `codTipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ruc` varchar(20) NOT NULL,
  `nombreProveedor` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorproducto`
--

CREATE TABLE `proveedorproducto` (
  `idProveedorProducto` int(11) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `codProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supermercado`
--

CREATE TABLE `supermercado` (
  `codSupermercado` int(11) NOT NULL,
  `nombreSuper` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `codEmpresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamaño`
--

CREATE TABLE `tamaño` (
  `codTamaño` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `idTelefono` int(11) NOT NULL,
  `codSupermercado` int(11) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

CREATE TABLE `temporada` (
  `codTemp` int(11) NOT NULL,
  `nombreTemp` varchar(50) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `codTipo` int(11) NOT NULL,
  `nombreTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vitrina`
--

CREATE TABLE `vitrina` (
  `codVitrina` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `codSupermercado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacensuper`
--
ALTER TABLE `almacensuper`
  ADD PRIMARY KEY (`codAlmacen`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`codArea`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- Indices de la tabla `cierre`
--
ALTER TABLE `cierre`
  ADD PRIMARY KEY (`idCierre`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- Indices de la tabla `clavesclientes`
--
ALTER TABLE `clavesclientes`
  ADD PRIMARY KEY (`idClave`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `clientecorporativo`
--
ALTER TABLE `clientecorporativo`
  ADD PRIMARY KEY (`ruc`);

--
-- Indices de la tabla `detallealmacensupermercado`
--
ALTER TABLE `detallealmacensupermercado`
  ADD PRIMARY KEY (`idDetalleAlmacenSuper`),
  ADD KEY `codAlmacen` (`codAlmacen`),
  ADD KEY `codProducto` (`codProducto`);

--
-- Indices de la tabla `detallekardex`
--
ALTER TABLE `detallekardex`
  ADD PRIMARY KEY (`idDetalleKardex`),
  ADD KEY `numKardex` (`numKardex`),
  ADD KEY `codProducto` (`codProducto`);

--
-- Indices de la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
  ADD PRIMARY KEY (`CodDetalleP`),
  ADD KEY `codProducto` (`codProducto`),
  ADD KEY `codTamaño` (`codTamaño`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `numVenta` (`numVenta`),
  ADD KEY `codProducto` (`codProducto`);

--
-- Indices de la tabla `documentoentrega`
--
ALTER TABLE `documentoentrega`
  ADD PRIMARY KEY (`codEntrega`),
  ADD KEY `codEmp` (`codEmp`);

--
-- Indices de la tabla `documentoventa`
--
ALTER TABLE `documentoventa`
  ADD PRIMARY KEY (`numVenta`),
  ADD KEY `codEmp` (`codEmp`),
  ADD KEY `codSupermercado` (`codSupermercado`),
  ADD KEY `dni` (`dni`),
  ADD KEY `ruc` (`ruc`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codEmp`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`codEmpresa`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`numKardex`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`codMarca`);

--
-- Indices de la tabla `numeracion`
--
ALTER TABLE `numeracion`
  ADD PRIMARY KEY (`idNumeracion`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- Indices de la tabla `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`numPrecio`),
  ADD KEY `CodDetalleP` (`CodDetalleP`);

--
-- Indices de la tabla `preciotempo`
--
ALTER TABLE `preciotempo`
  ADD PRIMARY KEY (`idPrecioTempo`),
  ADD KEY `numPrecio` (`numPrecio`),
  ADD KEY `codTemp` (`codTemp`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codProducto`),
  ADD KEY `codMarca` (`codMarca`),
  ADD KEY `codTipo` (`codTipo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ruc`);

--
-- Indices de la tabla `proveedorproducto`
--
ALTER TABLE `proveedorproducto`
  ADD PRIMARY KEY (`idProveedorProducto`),
  ADD KEY `ruc` (`ruc`),
  ADD KEY `codProducto` (`codProducto`);

--
-- Indices de la tabla `supermercado`
--
ALTER TABLE `supermercado`
  ADD PRIMARY KEY (`codSupermercado`),
  ADD KEY `codEmpresa` (`codEmpresa`);

--
-- Indices de la tabla `tamaño`
--
ALTER TABLE `tamaño`
  ADD PRIMARY KEY (`codTamaño`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`idTelefono`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- Indices de la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD PRIMARY KEY (`codTemp`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`codTipo`);

--
-- Indices de la tabla `vitrina`
--
ALTER TABLE `vitrina`
  ADD PRIMARY KEY (`codVitrina`),
  ADD KEY `codSupermercado` (`codSupermercado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cierre`
--
ALTER TABLE `cierre`
  MODIFY `idCierre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clavesclientes`
--
ALTER TABLE `clavesclientes`
  MODIFY `idClave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallealmacensupermercado`
--
ALTER TABLE `detallealmacensupermercado`
  MODIFY `idDetalleAlmacenSuper` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallekardex`
--
ALTER TABLE `detallekardex`
  MODIFY `idDetalleKardex` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `numeracion`
--
ALTER TABLE `numeracion`
  MODIFY `idNumeracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preciotempo`
--
ALTER TABLE `preciotempo`
  MODIFY `idPrecioTempo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedorproducto`
--
ALTER TABLE `proveedorproducto`
  MODIFY `idProveedorProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `idTelefono` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacensuper`
--
ALTER TABLE `almacensuper`
  ADD CONSTRAINT `almacensuper_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);

--
-- Filtros para la tabla `cierre`
--
ALTER TABLE `cierre`
  ADD CONSTRAINT `cierre_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);

--
-- Filtros para la tabla `clavesclientes`
--
ALTER TABLE `clavesclientes`
  ADD CONSTRAINT `clavesclientes_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`),
  ADD CONSTRAINT `clavesclientes_ibfk_2` FOREIGN KEY (`ruc`) REFERENCES `clientecorporativo` (`ruc`);

--
-- Filtros para la tabla `detallealmacensupermercado`
--
ALTER TABLE `detallealmacensupermercado`
  ADD CONSTRAINT `detallealmacensupermercado_ibfk_1` FOREIGN KEY (`codAlmacen`) REFERENCES `almacensuper` (`codAlmacen`),
  ADD CONSTRAINT `detallealmacensupermercado_ibfk_2` FOREIGN KEY (`codProducto`) REFERENCES `producto` (`codProducto`);

--
-- Filtros para la tabla `detallekardex`
--
ALTER TABLE `detallekardex`
  ADD CONSTRAINT `detallekardex_ibfk_1` FOREIGN KEY (`numKardex`) REFERENCES `kardex` (`numKardex`),
  ADD CONSTRAINT `detallekardex_ibfk_2` FOREIGN KEY (`codProducto`) REFERENCES `producto` (`codProducto`);

--
-- Filtros para la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
  ADD CONSTRAINT `detalleproducto_ibfk_1` FOREIGN KEY (`codProducto`) REFERENCES `producto` (`codProducto`),
  ADD CONSTRAINT `detalleproducto_ibfk_2` FOREIGN KEY (`codTamaño`) REFERENCES `tamaño` (`codTamaño`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`numVenta`) REFERENCES `documentoventa` (`numVenta`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`codProducto`) REFERENCES `producto` (`codProducto`);

--
-- Filtros para la tabla `documentoentrega`
--
ALTER TABLE `documentoentrega`
  ADD CONSTRAINT `documentoentrega_ibfk_1` FOREIGN KEY (`codEmp`) REFERENCES `empleado` (`codEmp`);

--
-- Filtros para la tabla `documentoventa`
--
ALTER TABLE `documentoventa`
  ADD CONSTRAINT `documentoventa_ibfk_1` FOREIGN KEY (`codEmp`) REFERENCES `empleado` (`codEmp`),
  ADD CONSTRAINT `documentoventa_ibfk_2` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`),
  ADD CONSTRAINT `documentoventa_ibfk_3` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`),
  ADD CONSTRAINT `documentoventa_ibfk_4` FOREIGN KEY (`ruc`) REFERENCES `proveedor` (`ruc`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);

--
-- Filtros para la tabla `numeracion`
--
ALTER TABLE `numeracion`
  ADD CONSTRAINT `numeracion_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);

--
-- Filtros para la tabla `precio`
--
ALTER TABLE `precio`
  ADD CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`CodDetalleP`) REFERENCES `detalleproducto` (`CodDetalleP`);

--
-- Filtros para la tabla `preciotempo`
--
ALTER TABLE `preciotempo`
  ADD CONSTRAINT `preciotempo_ibfk_1` FOREIGN KEY (`numPrecio`) REFERENCES `precio` (`numPrecio`),
  ADD CONSTRAINT `preciotempo_ibfk_2` FOREIGN KEY (`codTemp`) REFERENCES `temporada` (`codTemp`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codMarca`) REFERENCES `marca` (`codMarca`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`codTipo`) REFERENCES `tipoproducto` (`codTipo`);

--
-- Filtros para la tabla `proveedorproducto`
--
ALTER TABLE `proveedorproducto`
  ADD CONSTRAINT `proveedorproducto_ibfk_1` FOREIGN KEY (`ruc`) REFERENCES `proveedor` (`ruc`),
  ADD CONSTRAINT `proveedorproducto_ibfk_2` FOREIGN KEY (`codProducto`) REFERENCES `producto` (`codProducto`);

--
-- Filtros para la tabla `supermercado`
--
ALTER TABLE `supermercado`
  ADD CONSTRAINT `supermercado_ibfk_1` FOREIGN KEY (`codEmpresa`) REFERENCES `empresa` (`codEmpresa`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);

--
-- Filtros para la tabla `vitrina`
--
ALTER TABLE `vitrina`
  ADD CONSTRAINT `vitrina_ibfk_1` FOREIGN KEY (`codSupermercado`) REFERENCES `supermercado` (`codSupermercado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
