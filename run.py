import MySQLdb

db = MySQLdb.connect('127.0.0.1', 'root', '', 'blogracy-sim')
cursor = db.cursor()

sql = open('cycle.sql').read().split('\n')
for i in range(250):
    for x in sql:
        if len(x) > 0:
            cursor.execute(x)
    db.commit()
