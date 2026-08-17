USE relatorio_agrupado;

SELECT
    categoria,
    COUNT(*) AS total_vendas
FROM vendas
GROUP BY categoria;

SELECT
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY categoria;

SELECT
    categoria,
    AVG(valor_total) AS ticket_medio
FROM vendas
GROUP BY categoria;

SELECT
    categoria,
    COUNT(DISTINCT vendedor) AS vendedores_totais
FROM vendas
GROUP BY categoria;


SELECT
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY categoria
HAVING faturamento >= 1500;

SELECT
    vendedor,
    COUNT(*) AS total_vendas
FROM vendas
GROUP BY vendedor
HAVING total_vendas >= 2;

SELECT
    categoria,
    AVG(valor_total) AS ticket_medio
FROM vendas
HAVING ticket_medio > 400;


SELECT
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
WHERE data_venda >= '2026-06-10'
GROUP BY categoria
ORDER BY faturamento DESC;

SELECT
    categoria,
    SUM(valor_total) AS faturamento
FROM vendas
WHERE data_venda >= '2026-06-10'
GROUP BY categoria
HAVING faturamento > 1000
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
    categoria,
    COUNT(*) AS total_vendas,
    SUM(valor_total) AS faturamento,
    AVG(valor_total) AS ticket_medio
FROM vendas
GROUP BY categoria
HAVING faturamento >= 1200
    AND COUNT(DISTINCT vendedor) >= 2
ORDER BY ticket_medio DESC;