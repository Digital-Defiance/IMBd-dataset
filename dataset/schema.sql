

CREATE SEQUENCE sequence INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 50001 NO CYCLE;

CREATE TABLE dataset(id INTEGER PRIMARY KEY DEFAULT(nextval('sequence')), review VARCHAR, sentiment_id INTEGER, sentiment VARCHAR, score INTEGER, CHECK(((sentiment = 'pos') OR (sentiment = 'neg'))), CHECK(((score >= 7) OR (score <= 4))));




