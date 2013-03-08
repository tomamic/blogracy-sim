from __future__ import print_function
import MySQLdb

db = MySQLdb.connect('127.0.0.1', 'root', '', 'blogracy-sim')
cursor = db.cursor()

sql = open('cycle.sql').read().split('\n')
for i in range(50):
    for x in sql:
        if len(x) > 0 and x[0] != '#':
            print(x)
            res = cursor.execute(x)
            print(res)
            db.commit()
