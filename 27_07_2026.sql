USE relatorio_progresso;

/*SELECT COUNT (*) AS total_vendas
FROM vendas;

SELECT COUNT(vendedor) AS vendas_com_vendedor
FROM vendas;

SELECT SUM(valor_total) AS faturamento_total
FROM vendas;

SELECT SUM(quantidade_itens) AS itens_vendidos
FROM vendas;

SELECT AVG(valor_total) AS ticket_medio
FROM vendas;

SELECT AVG(quantidade_itens) AS media_itens_por_venda
FROM vendas;*/

SELECT
	COUNT(*) AS total_vendas,
	SUM(valor_total) AS faturamento_total,
	AVG(valor_total) AS ticket_medio
FROM vendas;