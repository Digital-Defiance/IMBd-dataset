


--- a positive review has a score >= 7 out of 10
--- negative review has a score <= 4 out of 10


CREATE SEQUENCE sequence_train START 1;


CREATE TABLE train (
    id INTEGER PRIMARY KEY default nextval('sequence_train'),
    review VARCHAR,
    sentiment_id INTEGER,
    sentiment VARCHAR CHECK (sentiment='pos' OR sentiment='neg'),
    score INTEGER CHECK (score >= 7 OR score <= 4)
);

CREATE SEQUENCE sequence_test START 1;

CREATE TABLE test (
    id INTEGER PRIMARY KEY default nextval('sequence_test'),
    review VARCHAR,
    sentiment_id INTEGER,
    sentiment VARCHAR CHECK (sentiment='pos' OR sentiment='neg'),
    score INTEGER CHECK (score >= 7 OR score <= 4)
);





