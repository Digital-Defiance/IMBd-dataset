
import duckdb
from prefect import flow, task
import os

from typing import TypeVar, Generic, Literal

T = TypeVar("T")

class Const(Generic[T]):
    ...

SQL_INIT_FILE: Const[str]  = "init.sql"

DatasetSplit = Literal["train", "test"]
Sentiment = Literal["pos", "neg"]

@task
def create_connection() -> duckdb.DuckDBPyConnection:
    return duckdb.connect()

@task
def close_connection(conn: duckdb.DuckDBPyConnection) -> None:
    conn.close()
    
@task
def create_tables(conn: duckdb.DuckDBPyConnection) -> duckdb.DuckDBPyRelation:
    with open(SQL_INIT_FILE) as file:
        init_cmd = file.read()
    return conn.sql(init_cmd)


@task
def ingest_data(conn: duckdb.DuckDBPyConnection, split: DatasetSplit, sentiment: Sentiment):
    path = f"raw-data/{split}/{sentiment}/"
    list_of_files = os.listdir(path)
    key = lambda file: int(file.split(".")[0].split("_")[0])
    for file in sorted(list_of_files, key=key):

        name = file.split(".")[0]
        sentiment_id, score = [int(x) for x in name.split("_")]
    
        with open(path + file) as file:
            review = file.read()

        cmd = f"INSERT INTO {split} (sentiment_id, score, review, sentiment) VALUES (?, ?, ?, ?);"
        values = (sentiment_id, score, review, sentiment)
        conn.execute(cmd, values)

@task
def write_result(conn):
    conn.sql(f"EXPORT DATABASE 'dataset' (FORMAT PARQUET);")

def yield_matrix():
    for split in ["test", "train"]:
        for sentiment in ["pos", "neg"]:
            yield split, sentiment

@flow
def main():
    conn = create_connection()
    create_tables(conn)
    for split, sentiment in yield_matrix():
        ingest_data(conn, split, sentiment)
    write_result(conn)
    close_connection(conn)


main()