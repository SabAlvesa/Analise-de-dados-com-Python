/*consultas simples*/

select * from  students;

select * from  class;

select * from  subject;

select * from  teachers;

select * from  students order by name_student;

select * from  subject order by workload >40;

select * from  grades where grande_value between 80 and 90;


/* classificando o nome dos estudantes na ordem crescente*/
select * from students
order by name_student;

/* classificando o nome dos estudantes na ordem decrescente*/
select * from students
order by name_student desc;

/* consulta que não tem uma descrição associada*/
select * from subject 
where description IS NULl;

/*Listando nome que tenha A e S*/
select *from teachers
where name_teacher like '%a%' or '%s%';

select  concat ( length (name_student), 'alves')  as resultado
from students;

select * from subject;

/* Retornar a média de Notas dos Alunos em história*/
select avg(grande_value) as media_historia
from grades
where id_subject = (
    select id_subject 
    from subject 
    where name_subject like '%História%'
);

/* Retornar as informações dos alunos cujo Nome começa com 'A'.*/
select * 
from students 
where name_student like 'A%';


/*Buscar apenas os alunos que fazem aniversário em março*/
select * 
from students 
where month (dt_birth) = 3;


/*Realizar uma consulta que calcula a idade dos Alunos.*/
select  id_student, name_student, dt_birth,
TIMESTAMPDIFF(year, dt_birth, CURDATE()) as idade
from students;


/* Retornar se o aluno está ou não aprovado. Aluno é considerado aprovado se a sua nota foi igual ou maior que 6.*/
select
    id_grades,
    id_student,
    id_subject,
    grande_value,
    dt_exam,
    case
        when grande_value >= 60 then 'Aprovado'
        else 'Reprovado'
    end as situacao
from grades;



