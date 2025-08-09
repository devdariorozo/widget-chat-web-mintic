-- ! ================================================================================================================================================
-- !                                                   SQL PARA CREAR TABLA HISTORICO CHAT
-- ! ================================================================================================================================================
-- @author Ramón Dario Rozo Torres (24 de Enero de 2025)
-- @lastModified Ramón Dario Rozo Torres (24 de Enero de 2025)
-- @version 1.0.0
-- v1/migrations/widget/chat/2025_01_24_create_tbl_historico_chat.sql

-- ! ELIMINAR TABLA SI EXISTE
DROP TABLE IF EXISTS `tbl_historico_chat`;

-- ! CREAR TABLA BAJO LAS SIGUIENTES ESPECIFICACIONES
CREATE TABLE `tbl_historico_chat` (
  `htcht_id` int NOT NULL AUTO_INCREMENT,
  `htcht_fk_id_chat` int NOT NULL,
  `htcht_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `htcht_accion` varchar(45) NOT NULL DEFAULT '-',
  `htcht_tipo` varchar(45) NOT NULL DEFAULT '-',
  `htcht_remitente` varchar(255) NOT NULL DEFAULT '-',
  `htcht_estado` varchar(45) NOT NULL DEFAULT '-',
  `htcht_gestion` varchar(45) NOT NULL DEFAULT '-',
  `htcht_arbol` varchar(45) NOT NULL DEFAULT '-',
  `htcht_control_api` LONGTEXT,
  `htcht_control_peticiones` varchar(45) NOT NULL DEFAULT 0,
  `htcht_resultado_api` LONGTEXT,
  `htcht_nombres` varchar(45) NOT NULL DEFAULT '-',
  `htcht_apellidos` varchar(45) NOT NULL DEFAULT '-',
  `htcht_numero_cedula` varchar(45) NOT NULL DEFAULT '-',
  `htcht_pais_residencia` varchar(250) NOT NULL DEFAULT '-',
  `htcht_ciudad_residencia` varchar(250) NOT NULL DEFAULT '-',
  `htcht_indicativo_pais` varchar(45) NOT NULL DEFAULT '-',
  `htcht_numero_celular` varchar(45) NOT NULL DEFAULT '-',
  `htcht_correo_electronico` varchar(45) NOT NULL DEFAULT '-',
  `htcht_autorizacion_datos_personales` varchar(45) NOT NULL DEFAULT 'No',
  `htcht_adjuntos` varchar(45) NOT NULL DEFAULT 'No',
  `htcht_ruta_adjuntos` varchar(1000) NOT NULL DEFAULT '-',
  `htcht_descripcion` varchar(255) NOT NULL DEFAULT '-',
  `htcht_registro` varchar(45) NOT NULL DEFAULT '-',
  `htcht_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `htcht_responsable` varchar(45) NOT NULL DEFAULT '-',
  PRIMARY KEY (`htcht_id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


