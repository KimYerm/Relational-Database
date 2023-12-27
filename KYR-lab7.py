# 6
'''
import mysql.connector
mydb = mysql.connector.connect(
host="localhost",
user = "root",
passwd = "root"
)
print(mydb)
'''

# 7
'''
mycursor = mydb.cursor()
mycursor.execute("CREATE DATABASE IF NOT EXISTS test")
mycursor.execute("SHOW DATABASES")
for db in mycursor:
    print(db)
mycursor.execute("USE test")
'''

import mysql.connector
def connectDB(db_use):
    mydb = mysql.connector.connect(
        host="localhost",
        user = "root",
        passwd = "root",
        database = db_use
)
    mycursor = mydb.cursor()
    return mydb, mycursor

# 9
'''
mydb, mycursor = connectDB("test")
mycursor.execute("DROP TABLE IF EXISTS drivers")
mycursor.execute("CREATE TABLE drivers(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), age INT)")
mycursor.execute("INSERT INTO drivers (name,age) VALUES ('Mika', 54)")
mydb.commit()
'''

# 10
'''
mydb, mycursor = connectDB("test")
sqlString = "INSERT INTO drivers (name,age) VALUES (%s, %s)"
f1drivers = [("Kimi", 42),("Valteri", 33),("Heikki", 40), ("Michael", 53)]
mycursor.executemany(sqlString, f1drivers)
mydb.commit()
print(mycursor.rowcount, "rows inserted successfully into drivers")
'''

# 11
'''
mydb, myCursor = connectDB("test")
myCursor.execute("SELECT name FROM drivers WHERE name LIKE '%k%'")
myResult = myCursor.fetchall()
for row in myResult:
    print(row)
'''

# 12
'''
mydb, mycursor = connectDB("test")
mycursor.execute("UPDATE drivers SET age=43 WHERE name = 'Kimi'")
mycursor.execute("UPDATE drivers SET name='Valtteri' WHERE name = 'Valteri'")
mydb.commit()
'''

# 13
'''
import mysql.connector
def selectALL(tbl, db_use):
    mydb, myCursor = connectDB(db_use)
    myCursor.execute("SELECT * FROM "+tbl)
    myResult = myCursor.fetchall()
    for row in myResult:
        print(row)

selectALL("drivers", "test")
'''

# 14
'''
mydb, mycursor = connectDB("test")
mycursor.execute("DELETE FROM drivers WHERE name LIKE 'M%'")
mydb.commit()
'''

'''
mydb, mycursor = connectDB("test")
mycursor.execute("DROP TABLE IF EXISTS drivers")
mydb.commit()
'''

# 15
'''
mydb, mycursor = connectDB("classicmodels")
mycursor.execute("SELECT orderNumber, productCode, SUM(quantityOrdered * priceEach) AS total_price "
                 "FROM orderdetails GROUP BY orderNumber, productCode "
                 "HAVING total_price > 5000 "
                 "ORDER BY total_price DESC LIMIT 25")
myResult = mycursor.fetchall()
for row in myResult:
    print(row)
'''

'''
mydb, mycursor = connectDB("classicmodels")
mycursor.execute("SELECT orderNumber, productCode, priceEach, SUM(quantityOrdered * priceEach) AS total_price "
                 "FROM orderdetails "
                 "WHERE orderLineNumber > 5 "
                 "GROUP BY orderNumber, productCode "
                 "HAVING total_price > 10000 "
                 "ORDER BY total_price DESC LIMIT 10")
myResult = mycursor.fetchall()
for row in myResult:
    print(row)
'''