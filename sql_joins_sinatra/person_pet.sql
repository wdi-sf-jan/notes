DROP DATABASE IF EXISTS person_pet_app;
CREATE DATABASE person_pet_app;

\c person_pet_app

CREATE TABLE person (
      id serial primary key,
      name text,
      age integer
    );

CREATE TABLE pet (
  id serial primary key,
  name text,
  age integer,
  breed text,
  person_id integer
);

  INSERT INTO person ( name, age)
        VALUES ('Zed', 37);

  INSERT INTO person ( name, age)
        VALUES ('Bobby', 7);

  INSERT INTO person ( name, age)
        VALUES ('John', 17);

  INSERT INTO pet (name, breed, age, person_id)
        VALUES ( 'Fluffy', 'Unicorn', 1000, 1);

  INSERT INTO pet (name, breed, age, person_id)
        VALUES ('Rocko', 'Dog', 4, 2);

  INSERT INTO pet (name, breed, age, person_id)
       VALUES ('Gigantor', 'Robot', 25, 1);

  INSERT INTO pet (name, breed, age, person_id)
       VALUES ('Goldy', 'Fish', 1, 2);

  INSERT INTO pet (name, breed, age, person_id)
      VALUES ('Czar', 'Cat', 10, NULL);  


\d+ person

\d+ pet








