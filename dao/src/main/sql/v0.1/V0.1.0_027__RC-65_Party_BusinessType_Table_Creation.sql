CREATE TABLE "DBO_TC"."PARTY_BUSINESSTYPE" 
   (ID NUMBER(*,0) NOT NULL ENABLE, 
	PARTY_ID NUMBER(*,0) NOT NULL ENABLE, 
	PARTY_BUSINESSTYPE_NAME_ID NUMBER(*,0) NOT NULL ENABLE,
	CONSTRAINT "PK_PARTY_BUSINESSTYPE_ID" PRIMARY KEY ("ID"),
	CONSTRAINT "FK_PARTY_BUSINESSTYPE_PARTY_ID" FOREIGN KEY ("PARTY_ID") REFERENCES "DBO_TC"."PARTY" ("PARTY_ID") ENABLE );
	
	
CREATE SEQUENCE  "DBO_TC"."SEQ_PARTY_BUSINESSTYPE_ID"  MINVALUE 1 MAXVALUE 999999999999999 INCREMENT BY 1;


CREATE OR REPLACE SYNONYM APP_TC.PARTY_BUSINESSTYPE FOR DBO_TC.PARTY_BUSINESSTYPE;
grant all on DBO_TC.PARTY_BUSINESSTYPE to APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.PARTY_BUSINESSTYPE FOR DBO_TC.PARTY_BUSINESSTYPE;
grant all on DBO_TC.PARTY_BUSINESSTYPE to APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.PARTY_BUSINESSTYPE FOR DBO_TC.PARTY_BUSINESSTYPE;
grant all on DBO_TC.PARTY_BUSINESSTYPE to APP_DP;


CREATE OR REPLACE SYNONYM APP_TC.SEQ_PARTY_BUSINESSTYPE_ID FOR DBO_TC.SEQ_PARTY_BUSINESSTYPE_ID;
grant all on DBO_TC.SEQ_PARTY_BUSINESSTYPE_ID to APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.SEQ_PARTY_BUSINESSTYPE_ID FOR DBO_TC.SEQ_PARTY_BUSINESSTYPE_ID;
grant all on DBO_TC.SEQ_PARTY_BUSINESSTYPE_ID to APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.SEQ_PARTY_BUSINESSTYPE_ID FOR DBO_TC.SEQ_PARTY_BUSINESSTYPE_ID;
grant all on DBO_TC.SEQ_PARTY_BUSINESSTYPE_ID to APP_DP;

commit;