-- 01. Conhecendo os dados e projeto da Insight Places.

-- 1.A Carregando os dados.
-- Primeiras consultas para conhecer o banco de dados:

SELECT * FROM alugueis LIMIT 10;
SELECT * FROM avaliacoes LIMIT 10;
SELECT * FROM clientes LIMIT 10;
SELECT * FROM enderecos LIMIT 10;
SELECT * FROM hospedagens LIMIT 10;
SELECT * FROM proprietarios LIMIT 10;

-- 1.B Explorando os dados.
-- Contando a quantidade de linhas das tabelas:

SELECT
	(SELECT COUNT(*) FROM alugueis) AS total_alugueis,
	(SELECT COUNT(*) FROM avaliacoes) AS total_avaliacoes,
	(SELECT COUNT(*) FROM clientes) AS total_clientes,
	(SELECT COUNT(*) FROM enderecos) AS total_enderecos,
	(SELECT COUNT(*) FROM hospedagens) AS total_hospedagens,
	(SELECT COUNT(*) FROM proprietarios) AS total_proprietarios;
    
-- 1.C Respondendo dúvidas de negócios.
-- Métrica - Consulta da Taxa de Ocupação:
-- Essa informação é crucial para entender o desempenho de cada imóvel e tomar decisões estratégicas sobre preços, promoções e outras ações.

SELECT
    hospedagem_id,
    MIN(data_inicio) AS primeira_data,
    SUM(DATEDIFF(data_fim, data_inicio)) AS dias_ocupados,
    DATEDIFF(MAX(data_fim), MIN(data_inicio)) AS total_dias,
    ROUND((SUM(DATEDIFF(data_fim, data_inicio)) / DATEDIFF(MAX(data_fim), MIN(data_inicio))) * 100) AS taxa_ocupacao
FROM
    alugueis
GROUP BY
    hospedagem_id
ORDER BY taxa_ocupacao DESC
;







