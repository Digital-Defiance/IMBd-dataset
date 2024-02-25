# IMBd-dataset

SOURCE: https://ai.stanford.edu/~amaas/data/sentiment/

The files in ´./raw-data' have been extracted directly from the source.




Using duckdb:


``sql
SELECT * FROM 'https://github.com/Digital-Defiance/IMBd-dataset/raw/main/dataset/test_neg.parquet';
SELECT * FROM 'https://github.com/Digital-Defiance/IMBd-dataset/raw/main/dataset/test_pos.parquet';

SELECT * FROM 'https://github.com/Digital-Defiance/IMBd-dataset/raw/main/dataset/train_neg.parquet';
SELECT * FROM 'https://github.com/Digital-Defiance/IMBd-dataset/raw/main/dataset/train_pos.parquet';

```
