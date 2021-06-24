DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS addresses CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS enrollments CASCADE;




CREATE TABLE students(
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);

CREATE TABLE classes(
  id        serial PRIMARY KEY,
  name      varchar(255) NOT NULL,
  credits   integer NOT NULL
);

CREATE TABLE addresses(
  id        serial PRIMARY KEY,
  line_1    varchar(255) NOT NULL,
  city      varchar(200) NOT NULL,
  state     varchar(20) NOT NULL,
  zipcode   varchar(10) NOT NULL
);

CREATE TABLE enrollments(
  id         serial PRIMARY KEY,
  student_id integer references students(id),
  class_id   integer references classes(id),
  grade      varchar(2)
);


ALTER TABLE students
  ADD CONSTRAINT fk_address_id
  FOREIGN KEY(address_id)
  REFERENCES addresses(id);
