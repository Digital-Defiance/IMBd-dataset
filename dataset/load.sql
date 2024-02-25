COPY test_neg FROM 'dataset/test_neg.parquet' (FORMAT 'parquet');
COPY test_pos FROM 'dataset/test_pos.parquet' (FORMAT 'parquet');
COPY train_neg FROM 'dataset/train_neg.parquet' (FORMAT 'parquet');
COPY train_pos FROM 'dataset/train_pos.parquet' (FORMAT 'parquet');
