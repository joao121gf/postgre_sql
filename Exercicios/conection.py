import psycopg2

conection = psycopg2.connect(
    database = 'engenharia_dados',
    host = 'localhost',
    user = 'postgres',
    password = 'postgres',
    port = '5432'
)

cur = conection.cursor()

print(conection.status)