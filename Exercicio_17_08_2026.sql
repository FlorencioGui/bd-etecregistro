USE escola_trilhas;

SELECT
    t.nome_trilha,
    t.area,
    t.carga_horaria,
    COUNT(a.id_alunos) AS total_alunos,
    CASE
        WHEN COUNT(a.id_aluno) >= 4 THEN 'Alta Procura'
        ELSE 'Procura Regular'
    END AS status_procura
FROM trilhas t
INNER JOIN alunos a
    ON t.id_trilha = a.id_trilha
GROUP BY t.id_trilha, t.nome_trilha, t.area, t.carga_horaria
HAVING COUNT(a.is_alunos) >= 2
ORDER BY total_alunos DESC, t.nome_trilha ASC;


SELECT
    a.nome_aluno,
    t.nome_trilha,
    t.carga_horaria
FROM alunos a
INNER JOIN trilhas t
    ON a.id_trilha = t.id_trilha
WHERE t.carga_horaria > (SELECT AVG(carga_horaria) FROM trilhas);