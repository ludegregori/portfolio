-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-10-23 14:40:51 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE luisa.cliente 
    ( 
     id_cliente INTEGER  NOT NULL , 
     nome       VARCHAR2 (100) , 
     email   VARCHAR2 (255) , 
     telefone   VARCHAR2 (15) , 
     endereco   VARCHAR2 (255) , 
     cidade     VARCHAR2 (100) , 
     uf         CHAR (2) , 
     cep        NUMBER (10) , 
     documento  VARCHAR2 (15) , 
     tipo       VARCHAR2 (20) 
    ) 
;

ALTER TABLE luisa.cliente 
    ADD CONSTRAINT cliente_PK PRIMARY KEY ( id_cliente ) ;

CREATE TABLE luisa.conta 
    ( 
     id_conta      INTEGER  NOT NULL , 
     tipo          VARCHAR2 (100) , 
     saldo_atual   NUMBER , 
     data_abertura DATE , 
     data_fínal    DATE , 
     id_cliente    INTEGER  NOT NULL 
    ) 
;

ALTER TABLE luisa.conta 
    ADD CONSTRAINT conta_PK PRIMARY KEY ( id_conta ) ;

CREATE TABLE luisa.historico 
    ( 
     id_historico INTEGER  NOT NULL , 
     id_transacao INTEGER  NOT NULL , 
     status       VARCHAR2 (30) , 
     data         DATE 
    ) 
;

ALTER TABLE luisa.historico 
    ADD CONSTRAINT historico_PK PRIMARY KEY ( id_historico ) ;

CREATE TABLE luisa.transacao 
    ( 
     id_transacao       INTEGER  NOT NULL , 
     tipo_transacao     VARCHAR2 (30) , 
     valor          NUMBER , 
     data               DATE , 
     id_conta_pagador   INTEGER  NOT NULL , 
     id_conta_recebedor INTEGER  NOT NULL , 
     status             VARCHAR2 (30) 
    ) 
;

ALTER TABLE luisa.transacao 
    ADD CONSTRAINT transacao_PK PRIMARY KEY ( id_transacao ) ;

ALTER TABLE luisa.conta 
    ADD CONSTRAINT conta_cliente_FK FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES luisa.cliente 
    ( 
     id_cliente
    ) 
;

ALTER TABLE luisa.historico 
    ADD CONSTRAINT historico_transacao_FK FOREIGN KEY 
    ( 
     id_transacao
    ) 
    REFERENCES luisa.transacao 
    ( 
     id_transacao
    ) 
;

ALTER TABLE luisa.transacao 
    ADD CONSTRAINT transacao_conta_FK FOREIGN KEY 
    ( 
     id_conta_pagador
    ) 
    REFERENCES luisa.conta 
    ( 
     id_conta
    ) 
;

ALTER TABLE luisa.transacao 
    ADD CONSTRAINT transacao_conta_FKv1 FOREIGN KEY 
    ( 
     id_conta_recebedor
    ) 
    REFERENCES luisa.conta 
    ( 
     id_conta
    ) 
;

CREATE SEQUENCE luisa.cliente_id_cliente_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER luisa.cliente_id_cliente_TRG 
BEFORE INSERT ON luisa.cliente 
FOR EACH ROW 
WHEN (NEW.id_cliente IS NULL) 
BEGIN 
    :NEW.id_cliente := luisa.cliente_id_cliente_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE luisa.transacao_id_transacao_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER luisa.transacao_id_transacao_TRG 
BEFORE INSERT ON luisa.transacao 
FOR EACH ROW 
WHEN (NEW.id_transacao IS NULL) 
BEGIN 
    :NEW.id_transacao := luisa.transacao_id_transacao_SEQ.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
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
-- CREATE SEQUENCE                          2
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
-- ERRORS                                   0
-- WARNINGS                                 0




CREATE SEQUENCE luisa.conta_id_conta_SEQ
START WITH 1
NOCACHE
ORDER;

CREATE OR REPLACE TRIGGER luisa.conta_id_conta_TRG
BEFORE INSERT ON luisa.conta
FOR EACH ROW
WHEN (NEW.id_conta IS NULL)
BEGIN
	:NEW.id_conta := luisa.conta_id_conta_SEQ.NEXTVAL; 
END;

CREATE SEQUENCE luisa.historico_id_historico_SEQ
START WITH 1
NOCACHE
ORDER;

CREATE OR REPLACE TRIGGER luisa.historico_id_historico_TRG
BEFORE INSERT ON luisa.historico
FOR EACH ROW
WHEN (NEW.id_historico IS NULL)
BEGIN
	:NEW.id_historico := luisa.historico_id_historico_SEQ.NEXTVAL;
END;


