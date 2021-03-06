
CREATE TABLE DBO_MP.MODULE_ACCESS_PERMISSION
(
  ID    						 NUMBER(11,0)          NOT NULL,
  MODULE_ACCESS_ID  			 NUMBER(11,0)          NOT NULL, 				 
  PERMISSION_ID					 NUMBER(11,0)		   NOT NULL,
  LAST_UPDATED_TS        		 TIMESTAMP(9) 		   DEFAULT CURRENT_TIMESTAMP NOT NULL,
  LAST_UPDATED_USER      		 VARCHAR2(50 BYTE)     NOT NULL,

  CONSTRAINT PK_MODULE_ACCESS_PERMISSION_ID PRIMARY KEY (ID)
);

ALTER TABLE DBO_MP.MODULE_ACCESS_PERMISSION ADD CONSTRAINT FK_MODULE_ACCESS_ID FOREIGN KEY(MODULE_ACCESS_ID) REFERENCES DBO_MP.MODULE_ACCESS(ID);
ALTER TABLE DBO_MP.MODULE_ACCESS_PERMISSION ADD CONSTRAINT FK_PERMISSION_ID FOREIGN KEY(PERMISSION_ID) REFERENCES DBO_MP.PERMISSIONS(PERMISSION_ID);

CREATE SEQUENCE DBO_MP.SEQ_MODULE_ACCESS_PERM_ID  MINVALUE 1 MAXVALUE 999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE;

------------- Create synonyms
CREATE OR REPLACE SYNONYM APP_TC.SEQ_MODULE_ACCESS_PERM_ID FOR DBO_MP.SEQ_MODULE_ACCESS_PERM_ID;
grant all on DBO_MP.SEQ_MODULE_ACCESS_PERM_ID to APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.SEQ_MODULE_ACCESS_PERM_ID FOR DBO_MP.SEQ_MODULE_ACCESS_PERM_ID;
grant all on DBO_MP.SEQ_MODULE_ACCESS_PERM_ID to APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.SEQ_MODULE_ACCESS_PERM_ID FOR DBO_MP.SEQ_MODULE_ACCESS_PERM_ID;
grant all on DBO_MP.SEQ_MODULE_ACCESS_PERM_ID to APP_DP;

--Create Synonyms for APP_MP
CREATE OR REPLACE SYNONYM APP_TC.MODULE_ACCESS_PERMISSION FOR DBO_MP.MODULE_ACCESS_PERMISSION;
GRANT ALL ON DBO_MP.MODULE_ACCESS_PERMISSION TO APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.MODULE_ACCESS_PERMISSION FOR DBO_MP.MODULE_ACCESS_PERMISSION;
GRANT ALL ON DBO_MP.MODULE_ACCESS_PERMISSION TO APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.MODULE_ACCESS_PERMISSION FOR DBO_MP.MODULE_ACCESS_PERMISSION;
GRANT ALL ON DBO_MP.MODULE_ACCESS_PERMISSION TO APP_DP;

