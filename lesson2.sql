# DDL - Databazanin yada datalarin taninmasi

import sqlite3

connection = sqlite3.connect("filmler")

# cursor:pointer;
cursor = connection.cursor()


def create__table():
    cursor.execute("CREATE TABLE IF NOT EXISTS yenifilm(name TEXT, rejisor TEXT, company TEXT, series INT)")


def add__data():
    cursor.execute("INSERT INTO yenifilm VALUES('The Last Samurai','Hans Zimmer','InterCom', 1)")
    connection.commit()
   
   
# name = input("Filmin adi: ")  # Check  
# rejisor = input("Filmin rejisoru: ")  # Check rejisor  
# company = input("Filmin yayin evi: ")    # Check yayin evi
# series = input("Filmin seriyalarinin sayi: ")    # Check series
    
              # Check,check rejisor ,check eviyayin evi ,check series
def dynamic_add_data(name, rejisor, company, series):
    cursor.execute("INSERT INTO yenifilm VALUES(?, ?, ?, ?)", (name, rejisor, company, series))
    connection.commit()
    
    
    
def show__data():
    cursor.execute("SELECT * FROM yenifilm")
    data = cursor.fetchall()  
    for row in data:
        print(row)
        
        
def dynamic_show_data(rejisor):
    cursor.execute("SELECT NAME FROM yenifilm WHERE rejisor=?", (rejisor, ))
    data = cursor.fetchall()  
    for row in data:
        print(row)
        
        
        
def update__data(old_company, new_company):
    # UPDATE yenifilm SET company='Netflix' WHERE rejisor='George R. R. Martin'
    cursor.execute("UPDATE yenifilm SET company=? WHERE company=?", (new_company, old_company))
    connection.commit()
        
   
   
rejisor = input("Rejisorun adi:  ")  

     
def delete__data(rejisor):
    # DELETE FROM yenifilm WHERE company = 'Rovsan'
    cursor.execute("DELETE FROM yenifilm WHERE rejisor=?", (rejisor,))      
    connection.commit() 
        
delete__data(rejisor)  
        
        
        
# update__data("George R. R. Martin", "Netflix")          
# dynamic_show_data("Game of Thrones")
# show__data()  
#              Check,check yazar,check evi,check series
# dynamic_add_data(name, rejisor, company, series)
# add__data()
# create__table()
connection.close()