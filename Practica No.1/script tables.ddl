-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-02-19 23:59:01 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Centros_de_evaluacion 
    ( 
     ID_centro                    INTEGER  NOT NULL , 
     Nombre                       VARCHAR2 (100) , 
     Direccion                    VARCHAR2 (100) , 
     ID_departamento              INTEGER , 
     ID_municipio                 INTEGER , 
     Departamento_ID_departamento INTEGER  NOT NULL , 
     Municipio_ID_municipio       INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Centros_de_evaluacion 
    ADD CONSTRAINT Centros_de_evaluacion_PK PRIMARY KEY ( ID_centro, Departamento_ID_departamento ) ;

CREATE TABLE Departamento 
    ( 
     ID_departamento INTEGER  NOT NULL , 
     Nombre          VARCHAR2 (100) 
    ) 
;

ALTER TABLE Departamento 
    ADD CONSTRAINT Departamento_PK PRIMARY KEY ( ID_departamento ) ;

CREATE TABLE Dia 
    ( 
     ID_dia         INTEGER  NOT NULL , 
     ID_escuela     INTEGER , 
     No_de_examenes INTEGER 
    ) 
;

ALTER TABLE Dia 
    ADD CONSTRAINT Dia_PK PRIMARY KEY ( ID_dia ) ;

CREATE TABLE Escuelas_de_automovilismo 
    ( 
     ID_Escuela                             INTEGER  NOT NULL , 
     ID_Centro_Evaluacion                   INTEGER , 
     Nombre                                 VARCHAR2 (100) , 
     Direccion                              VARCHAR2 (100) , 
     Numero_de_autorizacion                 INTEGER , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     Centros_de_evaluacion_ID_centro        INTEGER  NOT NULL , 
     Dia_ID_dia                             INTEGER , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     Centros_de_evaluacion_ID_departamento1 INTEGER  NOT NULL , 
     Departamento_ID_departamento           INTEGER  NOT NULL , 
     Municipio_ID_municipio                 INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Escuelas_de_automovilismo 
    ADD CONSTRAINT Escuelas_de_automovilismo_PK PRIMARY KEY ( ID_Escuela ) ;

CREATE TABLE Evaluacion 
    ( 
     ID_evaluacion         INTEGER  NOT NULL , 
     ID_fase1              INTEGER , 
     Id_fase2              INTEGER , 
     ID_tipo_licencia      INTEGER , 
     Tipo_licencia_ID_tipo INTEGER  NOT NULL , 
     Correlativo           INTEGER 
    ) 
;

ALTER TABLE Evaluacion 
    ADD CONSTRAINT Evaluacion_PK PRIMARY KEY ( ID_evaluacion ) ;

CREATE TABLE evaluacion_practica 
    ( 
     ID_evaluacion_practica   INTEGER  NOT NULL , 
     ID_evaluacion            UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    , 
     ID_instructor            INTEGER , 
     Punteo                   INTEGER , 
     Instructor_ID_instructor INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX evaluacion_practica__IDX ON evaluacion_practica 
    ( 
     Instructor_ID_instructor ASC 
    ) 
;

ALTER TABLE evaluacion_practica 
    ADD CONSTRAINT evaluacion_practica_PK PRIMARY KEY ( ID_evaluacion_practica ) ;

CREATE TABLE Instructor 
    ( 
     ID_instructor  INTEGER  NOT NULL , 
     Nombre         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     Identificacion INTEGER 
    ) 
;

ALTER TABLE Instructor 
    ADD CONSTRAINT Instructor_PK PRIMARY KEY ( ID_instructor ) ;

CREATE TABLE Intruccion_practica 
    ( 
     ID_intruccion                              INTEGER  NOT NULL , 
     ID_evaluacion_practica                     INTEGER , 
     Punteo                                     INTEGER , 
     Instruccion                                VARCHAR2 (100) , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     evaluacion_practica_ID_evaluacion_practica INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Intruccion_practica 
    ADD CONSTRAINT Intruccion_practica_PK PRIMARY KEY ( ID_intruccion ) ;

CREATE TABLE Municipio 
    ( 
     ID_municipio                 INTEGER  NOT NULL , 
     ID_departamento              INTEGER , 
     Nombre                       VARCHAR2 (100) , 
     Departamento_ID_departamento INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Municipio 
    ADD CONSTRAINT Municipio_PK PRIMARY KEY ( ID_municipio ) ;

CREATE TABLE Personas 
    ( 
     ID_persona                           INTEGER  NOT NULL , 
     ID_Escuela                           INTEGER , 
     Nombre_completo                      VARCHAR2 (100) , 
     Direccion                            VARCHAR2 (100) , 
     Identificacion                       INTEGER , 
     Telefono                             INTEGER , 
     Fotografia                           BLOB , 
     ID_Tipo_Licencia                     INTEGER , 
     ID_tramite                           INTEGER , 
     ID_Departamento                      INTEGER , 
     ID_municipio                         INTEGER , 
     Genero                               CHAR (1) , 
     Fecha_nacimiento                     DATE , 
     Evaluacion_ID_evaluacion             INTEGER  NOT NULL , 
     Departamento_ID_departamento         INTEGER , 
     Municipio_ID_municipio               INTEGER , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     Escuelas_de_automovilismo_ID_Escuela INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Personas__IDX ON Personas 
    ( 
     Evaluacion_ID_evaluacion ASC 
    ) 
;

ALTER TABLE Personas 
    ADD CONSTRAINT Personas_PK PRIMARY KEY ( ID_persona ) ;

CREATE TABLE Pregunta_teorica 
    ( 
     ID_pregunta_teorica           INTEGER  NOT NULL , 
     ID_respuesta_teorica_correcta INTEGER , 
     Texto                         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    
    ) 
;

ALTER TABLE Pregunta_teorica 
    ADD CONSTRAINT Pregunta_teorica_PK PRIMARY KEY ( ID_pregunta_teorica ) ;

CREATE TABLE Relation_6 
    ( 
     Evaluacion_ID_evaluacion             INTEGER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     Pregunta_teorica_ID_pregunta_teorica INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_PK PRIMARY KEY ( Evaluacion_ID_evaluacion, Pregunta_teorica_ID_pregunta_teorica ) ;

CREATE TABLE Relation_7 
    ( 
     Evaluacion_ID_evaluacion                   INTEGER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     evaluacion_practica_ID_evaluacion_practica INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_7 
    ADD CONSTRAINT Relation_7_PK PRIMARY KEY ( Evaluacion_ID_evaluacion, evaluacion_practica_ID_evaluacion_practica ) ;

CREATE TABLE Respuesta_teorica 
    ( 
     ID_respuesta_teorica                 INTEGER  NOT NULL , 
     ID_Pregunta_teorica                  INTEGER , 
     Texto                                VARCHAR2 (100) , 
     Imagen_de_referencia                 BLOB , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     Pregunta_teorica_ID_pregunta_teorica INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Respuesta_teorica 
    ADD CONSTRAINT Respuesta_teorica_PK PRIMARY KEY ( ID_respuesta_teorica ) ;

CREATE TABLE Tipo_licencia 
    ( 
     ID_tipo     INTEGER  NOT NULL , 
     Nombre      VARCHAR2 (100) , 
     Abreviatura CHAR (2) 
    ) 
;

ALTER TABLE Tipo_licencia 
    ADD CONSTRAINT Tipo_licencia_PK PRIMARY KEY ( ID_tipo ) ;

CREATE TABLE Tipo_tramite 
    ( 
     ID_tramite INTEGER  NOT NULL , 
     Tramite    VARCHAR2 (100) 
    ) 
;

ALTER TABLE Tipo_tramite 
    ADD CONSTRAINT Tipo_tramite_PK PRIMARY KEY ( ID_tramite ) ;

CREATE TABLE Tramite 
    ( 
     ID_tramite          INTEGER  NOT NULL , 
     tramite             VARCHAR2 (100) , 
     Personas_ID_persona INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Tramite__IDX ON Tramite 
    ( 
     Personas_ID_persona ASC 
    ) 
;

ALTER TABLE Tramite 
    ADD CONSTRAINT Tramite_PK PRIMARY KEY ( ID_tramite ) ;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Centros_de_evaluacion 
    ADD CONSTRAINT Centros_de_evaluacion_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_ID_departamento
    ) 
    REFERENCES Departamento 
    ( 
     ID_departamento
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Centros_de_evaluacion 
    ADD CONSTRAINT Centros_de_evaluacion_Municipio_FK FOREIGN KEY 
    ( 
     Municipio_ID_municipio
    ) 
    REFERENCES Municipio 
    ( 
     ID_municipio
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Escuelas_de_automovilismo 
    ADD CONSTRAINT Escuelas_de_automovilismo_Centros_de_evaluacion_FK FOREIGN KEY 
    ( 
     Centros_de_evaluacion_ID_centro,
     Centros_de_evaluacion_ID_departamento1
    ) 
    REFERENCES Centros_de_evaluacion 
    ( 
     ID_centro,
     Departamento_ID_departamento
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Escuelas_de_automovilismo 
    ADD CONSTRAINT Escuelas_de_automovilismo_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_ID_departamento
    ) 
    REFERENCES Departamento 
    ( 
     ID_departamento
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Escuelas_de_automovilismo 
    ADD CONSTRAINT Escuelas_de_automovilismo_Dia_FK FOREIGN KEY 
    ( 
     Dia_ID_dia
    ) 
    REFERENCES Dia 
    ( 
     ID_dia
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Escuelas_de_automovilismo 
    ADD CONSTRAINT Escuelas_de_automovilismo_Municipio_FK FOREIGN KEY 
    ( 
     Municipio_ID_municipio
    ) 
    REFERENCES Municipio 
    ( 
     ID_municipio
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE evaluacion_practica 
    ADD CONSTRAINT evaluacion_practica_Instructor_FK FOREIGN KEY 
    ( 
     Instructor_ID_instructor
    ) 
    REFERENCES Instructor 
    ( 
     ID_instructor
    ) 
;

ALTER TABLE Evaluacion 
    ADD CONSTRAINT Evaluacion_Tipo_licencia_FK FOREIGN KEY 
    ( 
     Tipo_licencia_ID_tipo
    ) 
    REFERENCES Tipo_licencia 
    ( 
     ID_tipo
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Intruccion_practica 
    ADD CONSTRAINT Intruccion_practica_evaluacion_practica_FK FOREIGN KEY 
    ( 
     evaluacion_practica_ID_evaluacion_practica
    ) 
    REFERENCES evaluacion_practica 
    ( 
     ID_evaluacion_practica
    ) 
;

ALTER TABLE Municipio 
    ADD CONSTRAINT Municipio_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_ID_departamento
    ) 
    REFERENCES Departamento 
    ( 
     ID_departamento
    ) 
;

ALTER TABLE Personas 
    ADD CONSTRAINT Personas_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_ID_departamento
    ) 
    REFERENCES Departamento 
    ( 
     ID_departamento
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Personas 
    ADD CONSTRAINT Personas_Escuelas_de_automovilismo_FK FOREIGN KEY 
    ( 
     Escuelas_de_automovilismo_ID_Escuela
    ) 
    REFERENCES Escuelas_de_automovilismo 
    ( 
     ID_Escuela
    ) 
;

ALTER TABLE Personas 
    ADD CONSTRAINT Personas_Evaluacion_FK FOREIGN KEY 
    ( 
     Evaluacion_ID_evaluacion
    ) 
    REFERENCES Evaluacion 
    ( 
     ID_evaluacion
    ) 
;

ALTER TABLE Personas 
    ADD CONSTRAINT Personas_Municipio_FK FOREIGN KEY 
    ( 
     Municipio_ID_municipio
    ) 
    REFERENCES Municipio 
    ( 
     ID_municipio
    ) 
;

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_Evaluacion_FK FOREIGN KEY 
    ( 
     Evaluacion_ID_evaluacion
    ) 
    REFERENCES Evaluacion 
    ( 
     ID_evaluacion
    ) 
;

ALTER TABLE Relation_6 
    ADD CONSTRAINT Relation_6_Pregunta_teorica_FK FOREIGN KEY 
    ( 
     Pregunta_teorica_ID_pregunta_teorica
    ) 
    REFERENCES Pregunta_teorica 
    ( 
     ID_pregunta_teorica
    ) 
;

ALTER TABLE Relation_7 
    ADD CONSTRAINT Relation_7_Evaluacion_FK FOREIGN KEY 
    ( 
     Evaluacion_ID_evaluacion
    ) 
    REFERENCES Evaluacion 
    ( 
     ID_evaluacion
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Relation_7 
    ADD CONSTRAINT Relation_7_evaluacion_practica_FK FOREIGN KEY 
    ( 
     evaluacion_practica_ID_evaluacion_practica
    ) 
    REFERENCES evaluacion_practica 
    ( 
     ID_evaluacion_practica
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Respuesta_teorica 
    ADD CONSTRAINT Respuesta_teorica_Pregunta_teorica_FK FOREIGN KEY 
    ( 
     Pregunta_teorica_ID_pregunta_teorica
    ) 
    REFERENCES Pregunta_teorica 
    ( 
     ID_pregunta_teorica
    ) 
;

ALTER TABLE Tramite 
    ADD CONSTRAINT Tramite_Personas_FK FOREIGN KEY 
    ( 
     Personas_ID_persona
    ) 
    REFERENCES Personas 
    ( 
     ID_persona
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             3
-- ALTER TABLE                             37
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  21
-- WARNINGS                                 0
