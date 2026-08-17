USE relatorio_progresso;

SELECT COUNT(*) AS total_registros
FROM vendas
WHERE data_venda >= '2026-05-08';

SELECT COUNT(*) AS total_vendas_informatica_com_2_itens
FROM vendas
WHERE categoria = 'Moveis';

SELECT SUM(quantidade_itens) AS total_itens_acima_de_300
FROM vendas 
WHERE valor_total >300;

SELECT AVG(valor_total) AS ticlet_medio_papelaria
FROM vendas 
WHERE categoria = 'Papelaria';

SELECT AVG(quantidade_itens) AS media_itens_por_data
FROM vendas 
WHERE data_venda >= '2026-05-08';

SELECT AVG(quantidade_itens) AS meia_valor_com_mais_de_2_itens
FROM vendas 
WHERE quantidade_itens>2;

SELECT 
    COUNT(*) AS total_vendas_informatica,
    SUM(valor_total) AS faturamento_total_informatica,
    AVG(valor_total) AS ticket_medio_informatica
FROM vendas
WHERE categoria = 'Informatica';

SELECT
    SUM(valor_total) / SUM(quantidade_itens) AS valor_medio_por_item,
    AVG(quantidade_itens) AS quantidade_media_itens
FROM vendas;