DROP TABLE IF EXISTS `db_edusys`.`administracion_modulos`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`administracion_modulos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_modulo` INT(11) NOT NULL,
  `creacion` DATE NOT NULL,
  `visible` INT(11) NOT NULL,
  `actualizacion` DATE NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`recursos`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`recursos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `detalle` TEXT NULL DEFAULT NULL,
  `id_asignatura` INT(11) NOT NULL,
  `id_nivel` INT(11) NOT NULL,
  `id_curso` INT(11) NOT NULL,
  `id_tipo` INT(11) NOT NULL,
  `id_creador` INT(11) NOT NULL,
  `src` TEXT NOT NULL,
  `type` TEXT NOT NULL,
  `id_estado` INT(11) NOT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`planificaciones`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`planificaciones` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `agno` INT(11) NOT NULL,
  `id_establecimiento` INT(11) NOT NULL,
  `id_profesor` INT(11) NOT NULL,
  `id_asignatura` INT(11) NOT NULL,
  `id_nivel` INT(11) NOT NULL,
  `id_curso` INT(11) NOT NULL,
  `inicio` DATETIME NULL DEFAULT NULL,
  `termino` DATETIME NULL DEFAULT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`evaluaciones`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`evaluaciones` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `fecha_creacion` DATE NOT NULL,
  `id_profesor` INT(11) NOT NULL,
  `id_nivel` INT(11) NOT NULL,
  `id_asignatura` INT(11) NOT NULL,
  `id_curso` INT(11) NOT NULL,
  `id_pregunta_evaluacion` INT(11) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`asignatura`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`asignatura` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `asignatura` VARCHAR(50) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_asignatura_recursos` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`recursos` (`id_asignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_planificaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`planificaciones` (`id_asignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_evaluaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`evaluaciones` (`id_asignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`curriculum`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`curriculum` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`establecimiento`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`establecimiento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_curriculum` INT(11) NOT NULL,
  `rbd` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `id_region` INT(11) NOT NULL,
  `id_provincia` INT(11) NOT NULL,
  `id_comuna` INT(11) NOT NULL,
  `codigo_postal` INT(11) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `pagina_web` VARCHAR(50) NULL DEFAULT NULL,
  `id_contrato` INT(11) NOT NULL,
  `id_rector` INT(11) NOT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_curriculum`),
  INDEX `fk_establecimiento_curriculum1_idx` (`id_curriculum` ASC) VISIBLE,
  CONSTRAINT `fk_establecimiento_curriculum1` FOREIGN KEY (`id_curriculum`) REFERENCES `db_edusys`.`curriculum` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`comunas`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`comunas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `comuna` VARCHAR(100) NOT NULL,
  `id_provincia` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comunas_establecimiento1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`establecimiento` (`id_comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`curso`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `curso` TEXT NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_curso_recursos1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`recursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_evaluaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`evaluaciones` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`matricula`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`matricula` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_establecimiento` INT(11) NOT NULL,
  `id_nivel` INT(11) NOT NULL,
  `id_estudiante` INT(11) NOT NULL,
  `id_apoderado` INT(11) NOT NULL,
  `agno_escolar` DATE NOT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `id_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `id_establecimiento`),
  INDEX `fk_matricula_establecimiento1_idx` (`id_establecimiento` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_establecimiento1` FOREIGN KEY (`id_establecimiento`) REFERENCES `db_edusys`.`establecimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`modulos_sistema`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`modulos_sistema` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nomobre` VARCHAR(50) NOT NULL,
  `header` TEXT NOT NULL,
  `body` TEXT NOT NULL,
  `footer` TEXT NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_modulos_sistema_administracion_modulos1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`administracion_modulos` (`id_modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`nivel`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`nivel` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(50) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_nivel_evaluaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`evaluaciones` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nivel_recursos1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`recursos` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nivel_planificaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`planificaciones` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`preguntas`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`preguntas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(50) NOT NULL,
  `tipo_pregunta` INT(11) NOT NULL,
  `id_detalle_pregunta` INT(11) NOT NULL,
  `id_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`pregunta_detalles`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`pregunta_detalles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` TEXT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pregunta_detalles_preguntas1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`preguntas` (`id_detalle_pregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`preguntas_evaluacion`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`preguntas_evaluacion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_evaluacion` INT(11) NOT NULL,
  `id_preguntas` INT(11) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_evaluacion`, `id_preguntas`),
  INDEX `fk_preguntas_evaluacion_evaluaciones1_idx` (`id_evaluacion` ASC) VISIBLE,
  INDEX `fk_preguntas_evaluacion_preguntas1_idx` (`id_preguntas` ASC) VISIBLE,
  CONSTRAINT `fk_preguntas_evaluacion_evaluaciones1` FOREIGN KEY (`id_evaluacion`) REFERENCES `db_edusys`.`evaluaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preguntas_evaluacion_preguntas1` FOREIGN KEY (`id_preguntas`) REFERENCES `db_edusys`.`preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`provincias`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`provincias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(100) NOT NULL,
  `id_region` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_provincias_establecimiento1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`establecimiento` (`id_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`region`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`region` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `region` VARCHAR(100) NOT NULL,
  `abreviatura` VARCHAR(4) NOT NULL,
  `capital` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_region_establecimiento1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`establecimiento` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`rol_usuario`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`rol_usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(50) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`usuarios`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rut` INT(11) NOT NULL,
  `pass` VARCHAR(32) NOT NULL,
  `id_rol` INT(11) NOT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_rol`),
  INDEX `fk_usuarios_rol_usuario1_idx` (`id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_recursos1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`recursos` (`id_creador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_rol_usuario1` FOREIGN KEY (`id_rol`) REFERENCES `db_edusys`.`rol_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_planificaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`planificaciones` (`id_profesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_evaluaciones1` FOREIGN KEY (`id`) REFERENCES `db_edusys`.`evaluaciones` (`id_profesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `db_edusys`.`usuario_establecimiento`;
CREATE TABLE IF NOT EXISTS `db_edusys`.`usuario_establecimiento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NOT NULL,
  `id_establecimiento` INT(11) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_usuario`, `id_establecimiento`),
  INDEX `fk_usuario_establecimiento_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_usuario_establecimiento_establecimiento1_idx` (`id_establecimiento` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_establecimiento_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `db_edusys`.`usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_establecimiento_establecimiento1` FOREIGN KEY (`id_establecimiento`) REFERENCES `db_edusys`.`establecimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
SET
  SQL_MODE = @OLD_SQL_MODE;
SET
  FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET
  UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;