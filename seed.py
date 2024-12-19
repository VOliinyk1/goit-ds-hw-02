import sqlite3
from random import randint

import faker

NUMBER_USERS = 30
NUMBER_STATUS = 3
NUMBER_TASKS = 10

fake_data = faker.Faker()
def generate_fake_data(number_users, number_status,
                       number_tasks) -> tuple:
    rand_users = []
    rand_status = [('new',), ('in progress',), ('completed',)]
    rand_tasks = []
    
    # Додаєм імена користувачів з емейлом
    for _ in range(number_users):
        rand_users.append((fake_data.name(), fake_data.email()))
    
    # Додаєм назви, описи, статуси і користувачів до тасків
    for i in range(number_tasks):
        rand_tasks.append((f'task{i}', fake_data.text()[:100], 
                           randint(1, len(rand_status)),
                           randint(1, len(rand_users))))
        
    return rand_users, rand_status, rand_tasks

def insert_data_in_db(users, status, tasks) -> None:
    with sqlite3.connect('tasks.db') as con:

        cur = con.cursor()

        sql_to_users = """INSERT INTO users(fullname, email) VALUES (?, ?)"""
        cur.executemany(sql_to_users, users)
        
        sql_to_status = """INSERT INTO status(name) VALUES (?)"""
        cur.executemany(sql_to_status, status)

        sql_to_tasks = """INSERT INTO tasks(title, description, status_id, user_id) VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_tasks, tasks)

        con.commit()

if __name__ == "__main__":
    users, status, tasks = generate_fake_data(NUMBER_USERS, NUMBER_STATUS, NUMBER_TASKS)
    insert_data_in_db(users, status, tasks)