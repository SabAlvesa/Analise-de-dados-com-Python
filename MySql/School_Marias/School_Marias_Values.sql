/*inserindo valores*/

use School_Marias;

INSERT INTO students VALUES
(1, 'Ana Silva', '2005-03-15', 'F', 'Rua A, 123', '11999990001', 'ana.silva@email.com'),
(2, 'Carlos Souza', '2004-07-22', 'M', 'Rua B, 456', '11999990002', 'carlos.souza@email.com'),
(3, 'Beatriz Lima', '2005-11-09', 'F', 'Rua C, 789', '11999990003', 'beatriz.lima@email.com');

INSERT INTO teachers VALUES
(1, 'Prof. João', '1980-02-10', 'M', '11988880001', 'joao@school.com'),
(2, 'Prof. Maria', '1975-06-25', 'F', '11988880002', 'maria@school.com'),
(3, 'Prof. Pedro', '1985-12-05', 'M', '11988880003', 'pedro@school.com');

INSERT INTO subject VALUES
(1, 1, 'Matemática', 'Matemática básica e avançada', 80),
(2, 2, 'História', 'História do Brasil e mundial', 60),
(3, 3, 'Física', 'Princípios básicos da física', 70);

INSERT INTO class VALUES
(1, 'Turma 1A', '2025-01-01', 1),
(2, 'Turma 1B', '2025-01-01', 2),
(3, 'Turma 2A', '2025-01-01', 3);

INSERT INTO class_subject VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO class_students VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO grades VALUES
(1, 1, 1, 90, '2025-06-10'),
(2, 2, 1, 85, '2025-06-10'),
(3, 3, 3, 88, '2025-06-11');



