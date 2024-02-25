


--- a positive review has a score >= 7 out of 10
--- negative review has a score <= 4 out of 10


CREATE SEQUENCE sequence START 1;



CREATE TABLE dataset (
    id INTEGER PRIMARY KEY default nextval('sequence'),
    review VARCHAR,
    sentiment_id INTEGER,
    sentiment VARCHAR CHECK (sentiment='pos' OR sentiment='neg'),
    score INTEGER CHECK (score >= 7 OR score <= 4)
);




