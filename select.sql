-- Отримати всі завдання певного користувача. Використайте SELECT для отримання завдань конкретного користувача за його user_id.\
SELECT * FROM tasks WHERE user_id = 23

-- Вибрати завдання за певним статусом. Використайте підзапит для вибору завдань з конкретним статусом, наприклад, 'new'.
SELECT * FROM tasks WHERE status_id = 1

-- Оновити статус конкретного завдання. Змініть статус конкретного завдання на 'in progress' або інший статус.
UPDATE tasks SET status_id = 2 WHERE id = 1

-- Отримати список користувачів, які не мають жодного завдання. Використайте комбінацію SELECT, WHERE NOT IN і підзапит.
SELECT *
FROM users
WHERE users.id NOT IN (SELECT user_id
    FROM tasks);

-- Додати нове завдання для конкретного користувача. Використайте INSERT для додавання нового завдання.
INSERT INTO tasks (title, description, status_id, user_id)
VALUEs ('task10', 'some description', 2, 1);

-- Отримати всі завдання, які ще не завершено. Виберіть завдання, чий статус не є 'завершено'.
SELECT * FROM tasks WHERE status_id IN (1, 2)

-- Видалити конкретне завдання. Використайте DELETE для видалення завдання за його id.
DELETE FROM tasks WHERE id = 10;

-- Знайти користувачів з певною електронною поштою. Використайте SELECT із умовою LIKE для фільтрації за електронною поштою.
SELECT * FROM users
WHERE email LIKE '%@example.net%';

-- Оновити ім'я користувача. Змініть ім'я користувача за допомогою UPDATE.
UPDATE users SET fullname = 'Viktor Melnyk' WHERE id = 4;