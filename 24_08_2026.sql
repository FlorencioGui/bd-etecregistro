-- ============================================================
-- BD2 - Junção de Dados com LEFT e RIGHT JOIN
-- Script base para acompanhar os exemplos da teoria em aula
-- ============================================================

-- CREATE DATABASE IF NOT EXISTS escola_trilhas;
-- USE escola_trilhas;

-- DROP TABLE IF EXISTS alunos;
-- DROP TABLE IF EXISTS trilhas;

-- CREATE TABLE trilhas (
--     id_trilha     INT AUTO_INCREMENT PRIMARY KEY,
--     nome_trilha   VARCHAR(80) NOT NULL,
--     area          VARCHAR(60) NOT NULL,
--     carga_horaria INT NOT NULL
-- );

-- CREATE TABLE alunos (
--     id_aluno       INT AUTO_INCREMENT PRIMARY KEY,
--     nome_aluno     VARCHAR(100) NOT NULL,
--     email          VARCHAR(100) NOT NULL,
--     data_matricula DATE NOT NULL,
--     id_trilha      INT,
--     CONSTRAINT fk_alunos_trilhas
--         FOREIGN KEY (id_trilha)
--         REFERENCES trilhas(id_trilha)
-- );

-- -- ============================================================
-- -- Carga inicial: trilhas
-- -- ============================================================

-- INSERT INTO trilhas (nome_trilha, area, carga_horaria)
-- VALUES
--     ('Desenvolvimento Web Full Stack', 'Desenvolvimento', 400),
--     ('Desenvolvimento Mobile',          'Desenvolvimento', 360),
--     ('Ciência de Dados e IA',          'Dados',           420),
--     ('Cibersegurança e Redes',         'Infraestrutura',  380),
--     ('Design de Experiência (UX/UI)',  'Design',          300);

-- -- ============================================================
-- -- Carga inicial: alunos
-- -- ============================================================

-- INSERT INTO alunos (nome_aluno, email, data_matricula, id_trilha)
-- VALUES
--     ('Ana Clara Silva',     'ana.silva@email.com',     '2026-02-10', 1),
--     ('Bruno Henrique',      'bruno.h@email.com',       '2026-02-11', 1),
--     ('Carla Dias',          'carla.dias@email.com',    '2026-02-12', 2),
--     ('Diego Ferreira',      'diego.f@email.com',       '2026-02-15', 3),
--     ('Elena Rostova',       'elena.r@email.com',       '2026-02-18', 3),
--     ('Felipe Melo',         'felipe.melo@email.com',   '2026-02-20', 2),
--     ('Gabriela Santos',     'gabi.santos@email.com',   '2026-02-22', 1),
--     ('Heitor Almeida',      'heitor.a@email.com',      '2026-02-25', 4),
--     ('Isabela Rocha',       'isabela.r@email.com',     '2026-03-01', 4),
--     ('João Pedro Costa',    'joao.costa@email.com',    '2026-03-02', 3),
--     ('Karen Lima',          'karen.lima@email.com',    '2026-03-05', 2),
--     ('Lucas Xavier',        'lucas.x@email.com',       '2026-03-08', 1),
--     ('Mariana Azevedo',     'mariana.a@email.com',     '2026-03-10', NULL),
--     ('Nicolas Prado',       'nicolas.p@email.com',     '2026-03-12', 3);


USE escola_trilhas;

SELECT
    a.nome_aluno,
    a.email,
    t.nome_trilha
FROM alunos a
LEFT JOIN trilhas t
    ON a.id_trilha = t.id_trilha;


SELECT
    a.nome_aluno,
    t.nome_trilha,
    t.area
FROM alunos a
RIGHT JOIN trilhas t
    ON a.id_trilha = t.id_trilha;

SELECT
    t.id_trilha,
    t.nome_trilha,
    t.area
FROM trilhas t
LEFT JOIN alunos a
    ON t.id_trilha = a.id_trilha
WHERE a.id_aluno IS NULL;

SELECT
    a.id_aluno,
    a.nome_aluno,
    a.email
FROM alunos a
LEFT JOIN trilhas t
    ON a.id_trilha = t.id_trilha
WHERE t.id_trilha IS NULL;