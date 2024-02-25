
import duckdb
from prefect import flow, task
import os

@task
def create_connection():
    return duckdb.connect()
    
@task
def create_tables(conn):
    with open("prepare.sql") as file:
        sql = file.read()
    conn.sql(sql)



@task
def ingest_data(conn, split, sentiment):
    path = f"raw-data/{split}/{sentiment}/"
    table_name = f"{split}_{sentiment}"
    for file in sorted(
        os.listdir(path),
        key = lambda file: int(file.split(".")[0].split("_")[0])
    ):
        name = file.split(".")[0]
        id, score = [int(x) for x in name.split("_")]
        full_path = path + file
        with open(full_path) as file:
            review = file.read()
    
        conn.execute(
            f"INSERT INTO {table_name} (id, score, review) VALUES (?, ?, ?)", 
            (id, score, review)
        )

@task
def write_result(conn):
    conn.sql("EXPORT DATABASE 'dataset' (FORMAT PARQUET);")

@flow
def main():
    conn = create_connection()
    create_tables(conn)

    for split in ["test", "train"]:
        for sentiment in ["pos", "neg"]:
            ingest_data(conn, split, sentiment)
    
    write_result(conn)
    
main()