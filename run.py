from __future__ import print_function
import sys
import MySQLdb

db = MySQLdb.connect('127.0.0.1', 'root', '', 'blogracy-sim')
cursor = db.cursor()

cycles = 50
if len(sys.argv) >= 2:
    cycles = int(sys.argv[1])

sql = open('cycle.sql').read().split('\n')
for i in range(cycles):
    for x in sql:
        if len(x) > 0 and x[0] != '#':
            print(x)
            res = cursor.execute(x)
            print(res)
            db.commit()
            
sql = open('collect.sql').read().split('\n')
for x in sql:
    if len(x) > 0 and x[0] != '#':
        print(x)
        res = cursor.execute(x)
        print(res)
        db.commit()
            

