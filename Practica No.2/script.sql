CREATE TABLE CENTRO (
    id_centro     NUMBER PRIMARY KEY,
    Nombre     VARCHAR2(255) NOT NULL
);

CREATE TABLE PREGUNTAS (
    id     NUMBER PRIMARY KEY,
    pregunta_texto           VARCHAR2(255) NOT NULL,
    respuesta number(5,2) NOT NULL,
    res1  VARCHAR2(255) NOT NULL,
    res2  VARCHAR2(255),
    res3  VARCHAR2(255),
    res4  VARCHAR2(255)
);


CREATE TABLE PREGUNTAS_PRACTICO (
    id_pregunta_practico     NUMBER PRIMARY KEY,
    pregunta_texto varchar2(255) not null,
    punteo NUMBER(5,2) NOT NULL
);

CREATE TABLE REGISTRO (
    id_registro     NUMBER PRIMARY KEY,
    ubicacion_escuela_id_escuela       NUMBER,
    ubicacion_centro_id_centro     NUMBER,
    respuesta        VARCHAR2(255),
    municipio_id_municipio NUMBER NOT NULL,
    municipio_departamento_id_departamento NUMBER NOT NULL,
    fecha DATE DEFAULT SYSDATE,
    tipo_tramite VARCHAR2(50) NOT NULL,
    tipo_licencia VARCHAR2(50) NOT NULL,
    nombre_completo VARCHAR2(255) NOT NULL,
    genero VARCHAR2(10) NOT NULL
);

CREATE TABLE CORRELATIVO (
    id_correlativo NUMBER PRIMARY KEY,
    fecha DATE DEFAULT SYSDATE,
    no_examen NUMBER NOT NULL
);

CREATE  TABLE EXAMEN (
    id_examen NUMBER PRIMARY KEY,
    registro_id_escuela NUMBER,
    registro_id_centro NUMBER,
    registro_municipio_id_municipio NUMBER,
    registro_municipio_departamento_id_departamento NUMBER,
    registro_id_registro NUMBER,
    correlativo_id_correlativo NUMBER
    );

CREATE TABLE RESPUESTA_USUARIO (
    id_respuesta_usuario NUMBER PRIMARY KEY,
    examen_id_examen NUMBER,
    pregunta_id_pregunta NUMBER,
    respuesta number(5,2) NOT NULL
    );

CREATE TABLE RESPUESTA_PRACTICO_USUARIO (
    id_respuesta_practico NUMBER PRIMARY KEY,
    examen_id_examen NUMBER,
    pregunta_practico_id_pregunta_practico NUMBER,
    nota number(5,2) NOT NULL
    );

CREATE TABLE ESCUELA (
    id_escuela NUMBER PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL,
    direccion VARCHAR2(255) NOT NULL,
    acuerdo VARCHAR2(255) NOT NULL
);


CREATE TABLE UBICACION (
    escuela_id_escuela NUMBER,
    centro_id_centro NUMBER
    );

CREATE TABLE DEPARTAMENTO (
    id_departamento NUMBER PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL,
    codigo VARCHAR2(10) NOT NULL
);

CREATE TABLE MUNICIPIO (
    id_municipio NUMBER PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL,
    codigo VARCHAR2(10) NOT NULL,
    departamento_id_departamento NUMBER NOT NULL
);