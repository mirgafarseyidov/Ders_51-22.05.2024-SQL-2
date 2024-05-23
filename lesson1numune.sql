# DDL - Databazanin yada datalarin taninmasi

import sqlite3

connection = sqlite3.connect("1000kitap")

# cursor:pointer;
cursor = connection.cursor()


def create__table():
    cursor.execute("CREATE TABLE IF NOT EXISTS minkitap(name TEXT, author TEXT, publisher TEXT, pages INT)")


def add__data():
    cursor.execute("INSERT INTO minkitap VALUES('Abc','Yoxlama','Yoxlama evi', 200)")
    connection.commit()
   
   
# name = input("Kitabin adi: ")  # Check  
# author = input("Kitabin yazari: ")  # Check yazar  
# publisher = input("Cap evi: ")    # Check evi
# pages = input("Kitabin sehifesi: ")    # Check page
    
              # Check,check yazar,check evi,check page
def dynamic_add_data(name, author, publisher, pages):
    cursor.execute("INSERT INTO minkitap VALUES(?, ?, ?, ?)", (name, author, publisher, pages))
    connection.commit()
    
    
    
def show__data():
    cursor.execute("SELECT * FROM minkitap")
    data = cursor.fetchall()  
    for row in data:
        print(row)
        
        
def dynamic_show_data(author):
    cursor.execute("SELECT NAME FROM minkitap WHERE AUTHOR=?", (author, ))
    data = cursor.fetchall()  
    for row in data:
        print(row)
        
        
        
def update__data(old_publisher, new_publisher):
    # UPDATE minkitap SET PUBLISHER='Xan kitab evi' WHERE AUTHOR='Xan evi'
    cursor.execute("UPDATE minkitap SET PUBLISHER=? WHERE PUBLISHER=?", (new_publisher, old_publisher))
    connection.commit()
        
   
   
author = input("Yazarin adi:  ")  
     
def delete__data(author):
    # DELETE FROM minkitap WHERE PUBLISHER = 'Rovsan'
    cursor.execute("DELETE FROM minkitap WHERE AUTHOR=?", (author,))      
    connection.commit() 
        
delete__data(author)  
        
        
        
# update__data("Xan evi", "Xan kitab evi")          
# dynamic_show_data("Dilbər")
# show__data()  
#              Check,check yazar,check evi,check page
# dynamic_add_data(name, author, publisher, pages)
# add__data()
# create__table()
connection.close()