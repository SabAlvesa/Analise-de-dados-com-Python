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


/*Buscar o nome do professor e a turma que ele é orientador*/
select t.name_teacher, c.name_class 
from teachers t
inner join class c on t.id_teacher = c.id_teacher;

    
/*Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática*/
select
    s.name_student,
    g.grande_value
from
    students s
inner join
    grades g on s.id_student = g.id_student
inner join    subject d ON g.id_subject = d.id_subject 
where
    d.name_subject = 'Matemática'
order by
    g.grande_value desc
limit 1;


/*Identificar o total de alunos por turma*/
select
    c.name_class,
    COUNT(s.id_student) as total_alunos
from
    class c
inner join
    students s on .id_class = s.id_class
group by
    c.name_class;

alter table students
add column id_class int;


 /*Listar os Alunos e as disciplinas em que estão matriculados*/
select
    s.name_student,
    d.name_subject
from
    students s
inner join
    grades g on s.id_student = g.id_student
inner join
    subject d on g.id_subject = d.id_subject;


/*Criar uma view que apresenta o nome, a disciplina e a nota dos alunos*/
create view vw_boletim_aluno as
select
    s.name_student,
    d.name_subject,
    g.grande_value
from
    students s
inner join
    grades g on s.id_student = g.id_student
inner join
    subject d on g.id_subject = d.id_subject;

select * from vw_boletim_aluno;

 /*Retorne todas as disciplinas*/
select name_subject from subject;


 /*Retorne os alunos que estão aprovados na disciplina de matemática*/
select
    s.name_student,
    g.grande_value
from
    students s
inner join
    grades g on s.id_student = g.id_student
inner join
    subject d on g.id_subject = d.id_subject
where
    d.name_subject = 'Matemática' and g.grande_value >= 6;
    
    
 /*Identificar o total de disciplinas por turma*/
select
    c.name_class,
    COUNT(distinct d.id_subject) as total_disciplinas
from
    class c
inner join
    students s on c.id_class = s.id_class
inner join
    grades g on s.id_student = g.id_student
inner join
    subject d on g.id_subject = d.id_subject
group by
    c.name_class;
    
    
/* Porcentagem dos alunos que estão aprovados*/
select
    CAST(SUM(CASE WHEN g.grande_value >= 7 THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 as porcentagem_aprovados
from
    grades g;
    
/*Porcentagem dos alunos que estão aprovados por disciplina*/
select
    d.name_subject,
    CAST(SUM(CASE WHEN g.grande_value >= 7 THEN 1 ELSE 0 END) AS REAL) / COUNT(g.id_student) * 100 as porcentagem_aprovados
from
    grades g
inner join
    subject d on g.id_subject = d.id_subject
group by
    d.name_subject;