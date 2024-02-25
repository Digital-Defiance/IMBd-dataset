


--- a positive review has a score >= 7 out of 10
CREATE TABLE template_pos (
    id INTEGER,
    review VARCHAR,
    score INTEGER CHECK (score >= 7),
);

--- negative review has a score <= 4 out of 10
CREATE TABLE template_neg (
    id INTEGER,
    review VARCHAR,
    score INTEGER CHECK (score <= 4),
);

CREATE TABLE test_pos AS FROM template_pos LIMIT 0;
CREATE TABLE test_neg AS FROM template_neg LIMIT 0;
CREATE TABLE train_pos AS FROM template_pos LIMIT 0;
CREATE TABLE train_neg AS FROM template_neg LIMIT 0;

DROP TABLE template_neg;
DROP TABLE template_pos;




