Introduction To Databasess
==================

## Objectives And Scope
* Install Postgres (server / client) onto your laptop
* Understand what a database is
* Know how to start postgres
* Know how to start psql client
* Use SQL to Create a database
* Use SQL to Create a table
* Use SQL to insert, select, update, and delete data
* Understand what Primary Keys are
* Begin learning about joins and more advanced queries.

## BEFORE YOU DO ANYTHING - Install Postgres.app
### Mac OSX - Install Postgres.app 
For the lesson we will be using Postgres as our database to demonstrate and practice what we are learning.  Postgres can be installed many ways, but for our purposes, Postgres.app will be the best option.  Please follow the instructions below if you have not done so already.

* Go to [http://postgresapp.com/](http://postgresapp.com/)
* Download and install
* Follow the __Command-Line Tools__ here: [http://postgresapp.com/documentation/cli-tools.html](http://postgresapp.com/documentation/cli-tools.html)

### Ubuntu - Install Postgres.app

	
```
	https://help.ubuntu.com/community/PostgreSQL
```


### Both Ubuntu and MAC OSX

* Verify the install was successful by typing ```psql``` in your terminal.  ```\q``` to quit.



__IF THIS DOES NOT WORK, STOP IMMEDIATELY AND GET HELP FROM AN INSTRUCTOR__


##Install	Client Gem
	
* Next install the pg gem if you have not done so already (you can see this by typing in gem list in terminal)

```
gem install pg
```
* If you get an error when installing try running using sudo with:


```
sudo gem install pg
```

# What is a database?

- Sometimes called a DBMS (Database Management System)
- It is a program that enforces structure on your data and allows a computer to quickly retreive data.
- A database should support CRUD operations.  
  - CRUD => Create, Read, Update, Delete
  
## Why Use a Database?

Why is it better than just writing to files?

* Data is structured
* Databases are transactional
* Data retrevial is fast
* Has a system for remote access
* Has a system for backup

## Types of Databases

__RDBMS (Relational Database Management System)__ The most common type of database today is a __relational database__.  Relational databases have tabular data with rows for each instance of data and columns for each attribut of that data.  Tables may refer to one another.  Relational databases typically use __SQL (Structured Query Language)__.

**Brands of RDBMS:**

* Postgres
* MySQL (Used to be very popular)
* Oracle (Commercial Product with lots of features)
* Microsoft SQL Server
* SQLite (Good for mobile development/Small applications)

__NoSQL__ There is also a school of thought called NoSql.  It is often a Key Value storage system and is not relational.  This is typically used in applications where a database does not scale well.  Example technologies include __MongoDB__, __Apache Couch__, __SimpleDB__.


## Getting started with psql

If you installed Postgress.app you have access to psql from the elephant icon at the top of the screen:

* ![image](https://raw.githubusercontent.com/wdi-sf-march-2014/notes/master/DatabasesIntro/Postgres.png)

If you are using the command line:

* In your terminal, type ```psql```.  

__psql__ is the (a) command line tool to interact with postgres databases, by default it connects to the localhost database with the name of the current user


psql has some of it's own command which begin with `\`


List all of the available databases:

```
\list
```

List all of the available tables in the current database:

```
\dt
```

There are lots of other commands which you can see with:

```
\?
```
Use `q` to exit the help screen

__ALL PSQL COMMANDS START WITH `\` __


At this point we should have a database with no tables in it.  So now we need to create tables - using SQL __(NOT to be confused with the psql app itself)__

# SQL: Structured Query Language

__A Brief History of Databases__

Before the notion of an RDBMS and a standard language for querying that data was created, there were many database venders.  Each vendor had different ways of storing data and very different ways of retreiving the data afterwards.  Moving data from one system to another was very costly.  Luckly in the 1970s SQL was created and later turned into a standard.  Modern relational databases are now based on the SQL standard, so moving from Postgres to Oracle is not nearly as much of a challenge as it used to be. 

__CRUD__

Stands for Create, Read, Update and Destroy.  This is the lifecycle of data in an applicatoin.  In SQL, CRUD can be mapped to the following __INSERT, SELECT, UPDATE, DELETE__.  We will walk through examples of in this section.


__ALL SQL COMMANDS MUST BE ENDED WITH A SEMICOLON IN THE PSQL SHELL__


## Creating a Database

Most database products have the notion of separate databases.  Lets create one for the lesson.  

```
CREATE DATABASE testdb;
```

Connect to a database 

```
\connect testdb

```
Once we connect, our command prompt should look similar to this: ```testdb=#```

List our tables:

```
\list
```

## What is a schema?

A database __schema__ is the definition that describes the entire configuration of the database

## What is a Primary Key?

It denotes an attribute on a table that can uniquely identify the row.

## What does SERIAL Do?

SERIAL tells the database to automatically assign the next unused integer value to id whenever we insert into the database and do not specify id.  In general, if you have a column that is set to SERIAL, it is a good idea to let the database assign the  value for you.

## Data Types

Similar to how Ruby has types of data, SQL defines types that can be stored in the DB. Here are some common ones:

* Serial
* Integer
* Numeric // Numbers are exact, no rounding error
* Float // Rounding error is possible, but operations are faster than Numeric
* Text, Varchar
* Timestamp
* Boolean (True or False)

## Normalization

Normalization is a more advanced database design topic.  The idea behind normalization is that the data in your table should not be repeated.  The introduction of the [wikipedia article on normalization](http://en.wikipedia.org/wiki/Database_normalization) gives a good summary.

##psql and SQL 

* CREATE a Database:

```
	CREATE DATABASE testdb;
```

* Connect to the new database:

```
	\connect testdb

 ->You are now connected to database "testdb" as user "stuart".
	
```

* CREATE a TABLE

```
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone VARCHAR(15),
    email TEXT
);
```

* INSERT (remember single quotes for text)

```
INSERT INTO students 
(name, phone, email) 
VALUES 
('Mary Wilson', '(510)-555-5555', 'bob@example.com');

```

* SELECT

```
SELECT id, email FROM students WHERE name = 'Bob Jones';
```

* UPDATE

```
UPDATE students SET email='bobby@example.com' WHERE name = 'Bob Jones';
```

* DELETE

```
DELETE from students WHERE name = 'Mary';
```

* QUIT psql 
```
/q
```

ADD A FOREIGN KEY

``` ALTER TABLE _____ ADD CONSTRAINT something_fk FOREIGN KEY (____) REFERENCES _____ (_____) ON DELETE NO ACTION; ```



## Some pg tips

- WHEN THE ICON SAYS - YOU NEED A ;
- WHEN THE ICON SAYS ' YOU NEED A '
- WHEN THE ICONS SAYS ( YOU NEED A )
- ALWAYS ALWAYS USE ''

### Start by creating a table

CREATE TABLE students(student_id SERIAL PRIMARY KEY, name VARCHAR(100), age INTEGER);

Different data types, VARCHAR, TEXT, FLOAT, INTEGER, PG even stores arrays and json!

## Add a student

INSERT INTO students (name,age) VALUES ('Elie',26);

## Find the student

SELECT * FROM students;
SELECT age FROM students;
SELECT name FROM students;

## Find a student more:

SELECT * (or columns separated by comma) FROM students WHERE _____;

SELECT * FROM students WHERE age < 33;

## Update a student

UPDATE students  SET name = 'Tom' WHERE name = 'Bob';

## Delete a student

DELETE FROM students WHERE name = 'Tom';

## Selecting specific data

Not equal - <>

- LIKE - SELECT * FROM students WHERE name LIKE '%';
- ORDER BY - SELECT * FROM students ORDER BY name DESC;
- COUNT - SELECT count(*) FROM students;
- MAX - SELECT max(age) FROM students;
- MIN - SELECT min(age) FROM students;
- AND - SELECT * from students WHERE name = 'Elie' AND age = 26; 
- OR - SELECT * from students WHERE name = 'Elie' OR name ='Mary'; 
- IN - SELECT * FROM students WHERE name IN ('Bob', 'Tom');
- NOT IN - SELECT * FROM students WHERE name NOT IN ('Bob', 'Tom');
- LIMIT - SELECT * FROM students LIMIT 2;
- OFFSET - SELECT * FROM students OFFSET 1;
- LIMIT + OFFSET - SELECT * FROM students LIMIT 2 OFFSET 1;
- % - SELECT * FROM students WHERE name LIKE '%b';

# Joins and FK


CREATE TABLE books (book_id SERIAL PRIMARY KEY, name VARCHAR(100), authorId INTEGER);
CREATE TABLE authors (author_id SERIAL PRIMARY KEY, name VARCHAR(100));

INSERT INTO authors (name) values ('Elie');
INSERT INTO authors (name) values ('Bob');

INSERT INTO books (name, authorId) values ('Book 1', 1);
INSERT INTO books (name, authorId) values ('Book 1', 2);


select * from authors join books on authors.author_id = books.authorId ORDER BY author_id ASC;


ALTER TABLE books ADD CONSTRAINT author_fk FOREIGN KEY (authorId) REFERENCES authors (author_id) ON DELETE NO ACTION;

ALTER TABLE books ADD COLUMN author_id INTEGER;

ALTER TABLE books ADD CONSTRAINT name_of_fk FOREIGN KEY (keyInTable) REFERENCES tableName (id) ON DELETE NO ACTION;






