#SQL + Sinatra

##Learning Objectives
- Combine our knowledge of SQL and Ruby
- Understand how to connect Postgres with Sinatra
- Explain what configuration settings are in Sinatra
- Build our first full-stack CRUD, database backed application! 

## Including the pg gem in our Sinatra app + configuring our application


You can read more about the pg gem [here](https://bitbucket.org/ged/ruby-pg/wiki/Home)

To start, add `require 'pg'` at the top of your ruby file and make sure that the Postgres server is running! Look for the elephant in the top of your screen.

##### Configuration

In order to not repeat ourselves a couple times, we are going to set some configuration variables in our sinatra app. You can read some more about that [here](http://www.sinatrarb.com/configuration.html). To get started, the syntax looks like this.

```
set :conn, PG.connect( dbname: 'testing')
```

When we use the configuration settings in sinatra, any variable that we add gets attached to the `settings` object. Right now, ee are setting a variable called 'conn' which has a value equal to the result of `PG.connect( dbname: 'testing')`. In order to access this new variable conn that we created, we use `settings.conn`

We can also wrap our configurations in a block: 

```
configure do
  set :conn, PG.connect( dbname: 'testing' )
end
```
##### Including the connection instance variable

Now that we have defined 'conn' using the Sinatra configuration, we will create an instance variable which stores the result of settings.conn and is applied before any code runs in our routes.

```
before do
  @conn = settings.conn
end
```

## Writing SQL Queries in a route

Once you have connected successfully, you can now write SQL using the .exec method.

The exec method takes an SQL query as a parameter and returns an array of values (as a hash for each row).

##### Passing in paramters

The second parameter to the exec method is an array of parameters. In SQL we specify parameters by using the $. An example of this would be:

`user = @conn.exec('SELECT * FROM authors WHERE id = ($1)', [ id ])`

-------------------------------------------

###SQL Joins Continued (Optional reading if you are interested)

###Why are Joins Important

The main function of a relational database is so that data can relate to each other. If we had users, and they wrote blog posts, it is important that we know which users wrote which posts.  

Imagine if facebook had no way of keeping track of what other users you were friends with, or which users wrote which post on your wall.  

###Relationships and Joins

In your first SQL lesson you learned how to CREATE TABLE and DROP TABLE, and how to do the four basic SQL operations: SELECT, INSERT, UPDATE, and DELETE. With these features, we have what is essentially a spreadsheet, a spreadsheet which enforces constraints on the type of data in each column via the schema. It's as if Excel could handle a million rows, but had no way of expressing the relationship between the items in one spreadsheet and another.

Postgres and other SQL databases are relational. They are designed for storing and viewing data that is interrelated. To do this, one table has a foreign key to another table. If rows are related, one column in each row will have the same value. Usually, a column in one row will contain the primary key of another row.

###Keys

**Primary Key:** The primary key of a relational table uniquely identifies each record in the table.  

**Foreign Key:**  a foreign key is a field (or collection of fields) in one table that uniquely identifies a row of another table.[1][2][3] In other words, a foreign key is a column or a combination of columns that is used to establish and enforce a link between the data in two tables.  

####Foreign Key Example

![foreign_key](foreign_key.png)


###Doing our first Join 

Setup sample database. In pqsl, run:

```
\i many_to_many/setup.sql
```

Take a few minutes to make sure tables were created and contain data.

The most common case is **`INNER JOIN`: Fetches data if present in both the tables.**

	SELECT person.name, pet.name from person
	INNER JOIN pet 
	ON person.id = pet.person_id;

Note that the type-part of the JOIN clause is optional, in which case the default is INNER if you just specify JOIN. So this does exactly the same:

	SELECT person.name, pet.name from person
	JOIN pet 
	ON person.id = pet.person_id;


###Other Types of Joins  

**A is person and B is pet**

![SQL Joins Diagram](http://lh5.ggpht.com/-fnOQYPFr8D0/UagAzBIgMvI/AAAAAAAABbo/3fBL5Fm3Y9Y/SQL%252520JOINs.jpg)  


LEFT, RIGHT and FULL Joins are called OUTER joins. The OUTER keyword is optional.

`LEFT (OUTER) JOIN`: Fetches data if present in the left table

```
SELECT person.name, pet.name from person
  LEFT JOIN pet
  ON person.id = pet.person_id;
```

```
SELECT person.name, pet.name from person
  LEFT JOIN pet
  ON person.id = pet.person_id
  WHERE pet.person_id IS NULL;
```


`RIGHT (OUTER) JOIN`: Fetches data if present in the right table.  

```
SELECT person.name, pet.name FROM person 
  RIGHT JOIN pet
  ON person.id = pet.person_id;
```  

```
SELECT person.name, pet.name FROM person 
  RIGHT JOIN pet
  ON person.id = pet.person_id
  WHERE person.id IS NULL;
```

`FULL (OUTER) JOIN`: Fetches data if present in either of the two tables.

```
SELECT person.name, pet.name FROM person 
  FULL JOIN pet
  ON person.id = pet.person_id;
```

```
SELECT person.name, pet.name FROM person 
  FULL JOIN pet
  ON person.id = pet.person_id
  WHERE person.id IS NULL OR  pet.person_id IS NULL;
```

`Cross Join`:  Joins everything to everything

```
SELECT person.name, pet.name FROM person
  CROSS JOIN pet;
```

##many to many relationships


**Students / Courses** is a "many-to-many" relationship; each student is linked to enrolled courses, while each course can of course have many students. To represent this, there is a `courses_student` table, a `student` table, and a `course` table to show the combinations which apply. 

To join twice and understand whether you're getting all the rows or just the ones with matches in all the tables can be confusing, so this is about showing you some examples.

In pqsl, run:

```
\i many_to_many/setup.sql
```

Explore `students_example` database.

Which students are enrolled in which courses?

Get all courses:

```
SELECT c.id, c.title FROM courses AS c;
```
	
OK, so we have some courses, looking at the relationship diagram, we can see we need to link across to `courses_students` table using the `id` of each course.	

```
SELECT c.id, c.title, cs.student_id FROM courses AS c
  JOIN courses_students AS cs
  ON cs.course_id = c.id;
```

I have aliased the table names to c and cs respectively. This is so that they are less in the way of us reading the important bits!   

There is now a join between two tables. The query doesn't specify what kind of join it is, but the default join type is `INNER JOIN`. You might notice that not all of the courses appear - only the ones where there are matching records in the `courses_students` table will match this query. (Math and History are not very popular).

To get more than the student_id, we need to join on the `students` table to get the details.

```
SELECT c.id, c.title, cs.student_id,s.name FROM courses AS c
   JOIN courses_students AS cs
   ON cs.course_id = c.id 
   JOIN students AS s
   ON cs.student_id = s.id;
```   
   
A many-to-many relationship join across three tables! This means two joins: one between the first table and the linking table, and another from the result of that query to the other end of the relationship. Each join operates between two data sets, which are the resultset you have so far, and the new table that is being joined. 

Now you have this result, you can start adding whatever `WHERE` clauses you need to get exactly the information you're after.

How about those "lost" courses, the ones without students? Or students that are not enrolled in any course?

```
SELECT c.id, c.title, cs.student_id,s.name FROM courses AS c
   LEFT JOIN courses_students AS cs
   ON cs.course_id = c.id 
   RIGHT JOIN students AS s
   ON cs.student_id = s.id;
```   

```
SELECT c.id, c.title, cs.student_id,s.name FROM courses AS c
   JOIN courses_students AS cs
   ON cs.course_id = c.id 
   RIGHT JOIN students AS s
   ON cs.student_id = s.id;
```   	