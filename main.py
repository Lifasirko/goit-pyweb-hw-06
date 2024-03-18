import psycopg2
from faker import Faker
import random

fake = Faker()

NUMBER_STUDENTS = 30
NUMBER_GROUPS = 3
NUMBER_DISCIPLINES = 5
NUMBER_TEACHERS = 3
MARKS_PER_STUDENT = 20


def create_tables(cur):
    cur.execute("""
            CREATE TABLE IF NOT EXISTS groups (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255)
            );
        """)

    cur.execute("""
        CREATE TABLE IF NOT EXISTS students (
            id SERIAL PRIMARY KEY,
            name VARCHAR(255),
            group_id INTEGER,
            CONSTRAINT fk_group FOREIGN KEY(group_id) REFERENCES groups(id)
        );
    """)

    cur.execute("""
        CREATE TABLE IF NOT EXISTS teachers (
            id SERIAL PRIMARY KEY,
            name VARCHAR(255)
        );
    """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS disciplines (
            id SERIAL PRIMARY KEY,
            name VARCHAR(255),
            teacher_id INTEGER REFERENCES teachers(id)
        );
    """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS marks (
            id SERIAL PRIMARY KEY,
            student_id INTEGER REFERENCES students(id),
            discipline_id INTEGER REFERENCES disciplines(id),
            mark INTEGER,
            date_received DATE
        );
    """)


def insert_fake_data(cur):
    # Додавання викладачів
    for _ in range(NUMBER_TEACHERS):
        cur.execute("INSERT INTO teachers (name) VALUES (%s)", (fake.name(),))

    # Додавання груп (без студентів на цей момент)
    for _ in range(NUMBER_GROUPS):
        cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.word(),))

    # Додавання дисциплін
    for _ in range(NUMBER_DISCIPLINES):
        cur.execute("INSERT INTO disciplines (name, teacher_id) VALUES (%s, %s)",
                    (fake.word(), random.randint(1, NUMBER_TEACHERS)))

    # Додавання студентів та призначення їм групи
    for _ in range(NUMBER_STUDENTS):
        group_id = random.randint(1, NUMBER_GROUPS)
        cur.execute("INSERT INTO students (name, group_id) VALUES (%s, %s)", (fake.name(), group_id))

    # Додавання оцінок
    for student_id in range(1, NUMBER_STUDENTS + 1):
        for _ in range(MARKS_PER_STUDENT):
            discipline_id = random.randint(1, NUMBER_DISCIPLINES)
            mark = random.randint(1, 10)
            date_received = fake.date_between(start_date="-1y", end_date="today")
            cur.execute("INSERT INTO marks (student_id, discipline_id, mark, date_received) VALUES (%s, %s, %s, %s)",
                        (student_id, discipline_id, mark, date_received))


def main():
    conn_str = "dbname=postgres user=postgres password=1111"  # Оновіть з вашими даними
    conn = psycopg2.connect(conn_str)
    cur = conn.cursor()

    create_tables(cur)
    insert_fake_data(cur)

    conn.commit()
    cur.close()
    conn.close()


if __name__ == "__main__":
    main()
