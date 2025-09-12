/*Criando database e adicionando tabelas*/

Create database School_Marias;
use School_Marias;

Create table students(
id_student int primary key ,
name_student varchar (50),
dt_birth date,
gender enum ('M', 'F', 'Others'),
adrees varchar(50),
telephone_student varchar (20),
email_student varchar(50)

);


Create table teachers(
id_teacher int primary key,
name_teacher varchar (50),
dt_birth date,
gender enum ('M', 'F', 'Others'),
telephone_teacher varchar (20),
email_teacher varchar(50)

);


Create table subject(
id_subject int primary key,
id_teacher int,
name_subject varchar (50),
description varchar(100),
workload INT,
foreign key (id_teacher) references teachers (id_teacher)

);

Create table class(
id_class int primary key,
name_class varchar (50),
school_year date,
id_teacher int,
foreign key (id_teacher) references teachers (id_teacher)
);

Create table class_subject(
id_class int,
id_subject int,
foreign key (id_class) references class (id_class),
foreign key (id_subject) references subject (id_subject),
primary key (id_class, id_subject)

);

Create table class_students(
id_class int,
id_student int,
foreign key (id_class) references class (id_class),
foreign key (id_student) references students(id_student),
primary key (id_class, id_student)

);

Create table grades(
id_grades int primary key,
id_student int,
id_subject int,
grande_value int,
dt_exam date,
foreign key (id_student) references students (id_student),
foreign key (id_subject) references subject (id_subject)

);
