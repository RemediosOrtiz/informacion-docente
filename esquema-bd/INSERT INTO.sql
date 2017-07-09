-- DROP DATABASE SISTEMA_GESTOR_DOCENTE;

CREATE DATABASE  SISTEMA_GESTOR_DOCENTE;

USE SISTEMA_GESTOR_DOCENTE;

SELECT * FROM USUARIO;


DELETE FROM USUARIO WHERE id_usuario = 5;

SELECT * FROM USUARIO_ROL  ORDER BY 1;

SELECT * FROM CONTACTO;

SELECT * FROM TIPO_LUGAR;




-- POBLAR CATALOGOS BASE DE DATOS
INSERT INTO USUARIO_ROL(id_usuario_rol, desc_rol)
VALUES (1, 'Administrador'), (2, 'Directivo'), (3, 'Secretaria'),  (4, 'Docente'), (5, 'Laboratorista');


INSERT INTO TIPO_LUGAR(id_tipo_lugar, desc_lugar)
VALUES (1, 'Otros'), (2, 'Casa'), (3, 'Trabajo'), (4, 'Personal');
