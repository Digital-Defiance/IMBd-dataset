

CREATE SEQUENCE sequence_test INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 25001 NO CYCLE;
CREATE SEQUENCE sequence_train INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 25001 NO CYCLE;

CREATE TABLE test(id INTEGER PRIMARY KEY DEFAULT(nextval('sequence_test')), review VARCHAR, sentiment_id INTEGER, sentiment VARCHAR, score INTEGER, CHECK(((sentiment = 'pos') OR (sentiment = 'neg'))), CHECK(((score >= 7) OR (score <= 4))));
CREATE TABLE train(id INTEGER PRIMARY KEY DEFAULT(nextval('sequence_train')), review VARCHAR, sentiment_id INTEGER, sentiment VARCHAR, score INTEGER, CHECK(((sentiment = 'pos') OR (sentiment = 'neg'))), CHECK(((score >= 7) OR (score <= 4))));




