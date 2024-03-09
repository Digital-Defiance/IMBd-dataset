# IMBd-dataset

SOURCE: https://ai.stanford.edu/~amaas/data/sentiment/

The files in ´./raw-data' have been extracted directly from the source.




Using duckdb:


```sql
SELECT * FROM 'https://github.com/Digital-Defiance/IMBd-dataset/raw/main/dataset/train.parquet';
SELECT * FROM 'https://github.com/Digital-Defiance/IMBd-dataset/raw/main/dataset/test.parquet';
```


To reproduce this dataset:

```
rm -rf dataset
pip install -r requirements.txt
python pipeline.py
```
