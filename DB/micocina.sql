-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-07-2017 a las 11:30:41
-- Versión del servidor: 5.7.18-0ubuntu0.16.04.1
-- Versión de PHP: 5.6.30-12~ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `micocina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id_accion` bigint(20) UNSIGNED NOT NULL,
  `id_controlador` bigint(20) NOT NULL,
  `descripcion` char(35) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion_grupo`
--

CREATE TABLE `accion_grupo` (
  `id_accion` bigint(20) NOT NULL,
  `id_controlador` bigint(20) NOT NULL,
  `id_grupo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlador`
--

CREATE TABLE `controlador` (
  `id_controlador` bigint(20) UNSIGNED NOT NULL,
  `id_modulo` bigint(20) NOT NULL,
  `descripcion` char(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancaria`
--

CREATE TABLE `cuenta_bancaria` (
  `id_cuenta_bancaria` bigint(20) UNSIGNED NOT NULL,
  `cuenta` varchar(50) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` bigint(20) UNSIGNED NOT NULL,
  `nombre` char(25) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` char(255) COLLATE utf8_spanish_ci NOT NULL,
  `administrador` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nombre`, `descripcion`, `administrador`) VALUES
(1, 'admin', 'GRUPO ADMIN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` bigint(20) UNSIGNED NOT NULL,
  `descripcion` char(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` bigint(20) UNSIGNED NOT NULL,
  `id_persona` int(11) NOT NULL,
  `slogan` varchar(250) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` bigint(20) NOT NULL,
  `tlf1` char(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlf2` char(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` char(60) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` char(255) COLLATE utf8_spanish_ci NOT NULL,
  `fnacimiento` date DEFAULT NULL,
  `nacionalidad` char(1) COLLATE utf8_spanish_ci DEFAULT 'V',
  `nombres` char(60) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_tipo_persona` int(11) NOT NULL,
  `id_cuenta_bancaria` int(11) NOT NULL,
  `fecha_create` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `tlf1`, `tlf2`, `apellidos`, `direccion`, `fnacimiento`, `nacionalidad`, `nombres`, `sexo`, `id_tipo_persona`, `id_cuenta_bancaria`, `fecha_create`) VALUES
(1, '', '', 'ADMINISTRADOR', 'BNA', '2017-06-01', 'V', 'SISTEMA', 'M', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `id_tipo_persona` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id_tipo_persona`, `nombre`) VALUES
(1, 'COCINERO'),
(2, 'CLIENTE'),
(3, 'MIXTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `login` char(32) COLLATE utf8_spanish_ci NOT NULL,
  `password` char(64) COLLATE utf8_spanish_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `login`, `password`, `auth_key`) VALUES
(1, 1, 'anrto_94_5@hotmail.com', '202cb962ac59075b964b07152d234b70', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_grupo`
--

CREATE TABLE `usuario_grupo` (
  `id_grupo` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_grupo`
--

INSERT INTO `usuario_grupo` (`id_grupo`, `id_usuario`) VALUES
(1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id_accion`),
  ADD UNIQUE KEY `id_accion` (`id_accion`),
  ADD UNIQUE KEY `id_controlador` (`id_controlador`,`descripcion`);

--
-- Indices de la tabla `accion_grupo`
--
ALTER TABLE `accion_grupo`
  ADD PRIMARY KEY (`id_accion`,`id_controlador`,`id_grupo`);

--
-- Indices de la tabla `controlador`
--
ALTER TABLE `controlador`
  ADD PRIMARY KEY (`id_controlador`),
  ADD UNIQUE KEY `id_controlador` (`id_controlador`),
  ADD UNIQUE KEY `id_modulo` (`id_modulo`,`descripcion`);

--
-- Indices de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD UNIQUE KEY `id_cuenta_bancaria` (`id_cuenta_bancaria`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`),
  ADD UNIQUE KEY `id_grupo` (`id_grupo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`),
  ADD UNIQUE KEY `id_modulo` (`id_modulo`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD UNIQUE KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD UNIQUE KEY `id_tipo_persona` (`id_tipo_persona`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`),
  ADD UNIQUE KEY `cedula` (`id_persona`);

--
-- Indices de la tabla `usuario_grupo`
--
ALTER TABLE `usuario_grupo`
  ADD PRIMARY KEY (`id_grupo`,`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id_accion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `controlador`
--
ALTER TABLE `controlador`
  MODIFY `id_controlador` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  MODIFY `id_cuenta_bancaria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `id_tipo_persona` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
