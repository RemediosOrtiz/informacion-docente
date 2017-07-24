DROP DATABASE SISTEMA_GESTOR_DOCENTE;

CREATE DATABASE  SISTEMA_GESTOR_DOCENTE;

USE SISTEMA_GESTOR_DOCENTE;

SELECT * FROM USUARIO;


-- DELETE FROM USUARIO WHERE id_usuario = 5;

SELECT * FROM USUARIO_ROL  ORDER BY 1;

SELECT * FROM CONTACTO;

SELECT * FROM TIPO_LUGAR;


SELECT * FROM DIRECCION;

SELECT * FROM DOCENTE_LABORAL;

SELECT * FROM CARRERA_C;




-- POBLAR CATALOGOS BASE DE DATOS
INSERT INTO USUARIO_ROL(id_usuario_rol, desc_rol)
VALUES (1, 'Administrador'), (2, 'Directivo'), (3, 'Secretaria'),  (4, 'Docente'), (5, 'Laboratorista');


INSERT INTO TIPO_LUGAR(id_tipo_lugar, desc_lugar)
VALUES (1, 'Otros'), (2, 'Casa'), (3, 'Trabajo'), (4, 'Personal');


INSERT INTO NIVEL_ESTUDIO_C(id_nivel_estudio_c, desc_nivel_estudio)
VALUES(1,'TSU'), (2,'LIC. SIN GRADO'), (3,'LIC. CON GRADO'), (4,'ESPECIALIDAD'), (5,'TEACHER'), (6,'MTRIA. SIN GRADO'),
(7,'MTRIA. CON GRADO'), (8,'DOCTORADO SIN GRADO'), (9,'DOCTORADO CON GRADO');



SELECT * FROM DOCENTE_ACADEMICO;

SELECT * FROM DOCENTE_LABORAL;




SELECT * FROM EDIFICIO_C;

INSERT INTO EDIFICIO_C (`id_edificio`, `nombre_edicicio`) VALUES ('1', 'Edificio A'),('2', 'Edficio B'),('3', 'Edficio C'),('4', 'Edficio D'),('5', 'Edficio E'),('6', 'Edficio G'),('7', 'Edficio H'),('8', 'Edficio J'),('9', 'Edficio K'),('10', 'Edficio O'),('11', 'Edficio Z');



SELECT * FROM CARRERA_C;

INSERT INTO CARRERA_C (id_carrera_c, id_edificio, nombre_carrera, acronimo_carrera, nivel_estudio) VALUES
(1, 1, 'Administración, Área Administración y Evaluación de Proyectos', 'XXXX', 'Nivel TSU'),
(2, 1, 'Administración, Área Recursos Humanos', 'XXXX', 'Nivel TSU'),
(3, 1, 'Desarrollo de Negocios, Área Mercadotecnia', 'XXXX', 'Nivel TSU'),
(4, 1, 'Mantenimiento, Área Industrial', 'XXXX', 'Nivel TSU'),
(5, 1, 'Mecatrónica, Área Automatización', 'XXXX', 'Nivel TSU'),
(6, 1, 'Nanotecnología, Área Materiales', 'XXXX', 'Nivel TSU'),
(7, 1, 'Procesos Industriales, Área Manufactura', 'XXXX', 'Nivel TSU'),
(8, 1, 'Química, Área Biotecnología', 'XXXX', 'Nivel TSU'),
(9, 1, 'Tecnologías de la Información y Comunicación, Área Sistemas Informáticos', 'XXXX', 'Nivel TSU'),
(10, 1, 'Tecnologías de la Información y Comunicación, área Redes y Telecomunicaciones', 'XXXX', 'Nivel TSU'),
(11, 1, 'Energías Renovables, Área Calidad y Ahorro de Energía', 'XXXX', 'Nivel TSU'),
(12, 1, 'Biotecnología', 'XXXX', 'Nivel Ingeniería'),
(13, 1, 'Gestión de Proyectos', 'XXXX', 'Nivel Ingeniería'),
(14, 1, 'Mantenimiento Industrial', 'XXXX', 'Nivel Ingeniería'),
(15, 1, 'Mecatrónica', 'XXXX', 'Nivel Ingeniería'),
(16, 1, 'Nanotecnología', 'XXXX', 'Nivel Ingeniería'),
(17, 1, 'Negocios y Gestión Empresarial', 'XXXX', 'Nivel Ingeniería'),
(18, 1, 'Procesos y Operaciones Industriales', 'XXXX', 'Nivel Ingeniería'),
(19, 1, 'Tecnologías de la Información y Comunicación', 'XXXX', 'Nivel Ingeniería');



SELECT * FROM DOCENTE_LABORAL;



