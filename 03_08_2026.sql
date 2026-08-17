USE relatorio_agrupado;
SELECT 
    categoria,
    COUNT(*) AS total_vendas
FROM vendas
GROUP BY categoria;
-- COUNT(*): conta o número total de registros em cada categoria.
-- GROUP BY: agrupa os registros por categoria antes de aplicar a função de agregação.

SELECT
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY categoria;
-- SUM(valor_total): soma os valores totais de vendas em cada categoria.
-- GROUP BY: agrupa as vendas por categoria para calcular a soma em cada grupo.

SELECT 
    categoria,
    MIN(valor_total) AS menor_venda,
    MAX(valor_total) AS maior_venda
FROM vendas
GROUP BY categoria;
-- MIN(valor_total): retorna o menor valor_total dentro de cada categoria.
-- MAX(valor_total): retorna o maior valor_total dentro de cada categoria.

SELECT
    categoria,
    COUNT(DISTINCT vendedor) AS vendedores_ativos
FROM vendas
GROUP BY categoria;
-- COUNT(DISTINCT vendedor): conta apenas vendedores diferentes, sem repetir o mesmo vendedor.
-- GROUP BY: agrupa por categoria para que a contagem seja feita dentro de cada grupo.

SELECT
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY categoria
HAVING SUM(valor_total) >= 2000;

-- O GROUP BY RESUME TODAS AS LINHAS DE UMA TABELA EM UM GRUPO, NESSE CASO, ESTAMOS AGRUPANDO POR CATEGORIA.
-- O HAVING É USADO PARA FILTRAR OS RESULTADOS DE UM GROUP BY, DIFERENTE DO WHERE QUE FILTRA ANTES DO AGRUPAMENTO. AQUI, ESTAMOS FILTRANDO PARA MOSTRAR APENAS AS CATEGORIAS COM FATURAMENTO TOTAL MAIOR QUE 2000. ELE EXECUTA TODOS OS COMANDOS ANTES MESMO DE FILTRAR, POR ISSO, ACABA SE TORNANDO MAIS PESADO.

SELECT
    categoria,
    COUNT(*) AS total_vendas
FROM vendas
GROUP BY categoria
HAVING COUNT(*) > 3;

SELECT 
    categoria,
    AVG(valor_total) AS ticket_medio
FROM vendas
WHERE data_venda >= '2026-06-10'
GROUP BY categoria
HAVING AVG(valor_total) >= 500;

SELECT
    categoria,
    COUNT(*) AS total_vendas,
    SUM(valor_total) AS faturamento,
    AVG(valor_total) AS ticket_medio
FROM vendas
GROUP BY categoria
HAVING SUM(valor_total) >= 1000
ORDER BY faturamento DESC;

SELECT
    categoria,
    vendedor,
    COUNT(*) AS total_vendas,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY categoria, vendedor
ORDER BY categoria, faturamento DESC;

SELECT
    DATE_FORMAT(data_venda, '%Y-%m') AS mes,
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY mes, categoria
HAVING SUM(valor_total) >= 700
ORDER BY mes, faturamento DESC;