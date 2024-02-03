-- Query 1: Dado uma empresa, identificar quais os canais patrocinados e os valores de patrocínio pago.
SELECT c.nome_unico AS "Nome do Canal", p.valor_patrocinio AS "Valor do Patrocinio" FROM Canal c
INNER JOIN Patrocinio p ON c.nome_unico = p.nome_unico
INNER JOIN Empresa e ON e.id_unico = c.id_patrocinador
WHERE e.nome = 'Empresa1';

-- Query 2: Dado um usuário, descobrir de quantos canais ele é membro e a soma do valor desembolsado por mês.
SELECT 
	MNC.nick_membro AS NomeUsuario, 
	COUNT(MNC.nick_membro) AS QuantCanais, 
    SUM(n.valor_nivel) AS ValorDesembolsado
FROM MNC
JOIN Nivel n ON n.num_nivel = MNC.num_nivel 
	AND MNC.nome_canal = n.nome_canal 
	AND MNC.id_plataforma = n.id_plataforma
WHERE MNC.nick_membro = 'user1';

-- Query 3: Listar e ordenar os canais que já receberam doações (quantidade de doações, não é a soma dos valores).
SELECT nome_canal AS NomeCanal, COUNT(nome_canal) AS QuantDoacoes FROM Donate
WHERE STATUS != 'recusado'
GROUP BY nome_canal;

-- Query 4: Dado um vídeo liste a soma das doações guardadas pelos comentários que foram lidos.
SELECT v.nome_canal AS Canal, v.titulo AS Video, v.id_plataforma AS IdPlataforma, SUM(d.valor) AS SomaDoacoes
FROM Video v
JOIN Comentario c ON v.nome_canal = c.nome_canal 
	AND v.id_plataforma = c.id_plataforma 
	AND v.titulo = c.titulo_video
JOIN Donate d ON c.nick_usuario = d.nick 
	AND c.nome_canal = d.nome_canal
	AND c.id_plataforma = d.id_plataforma
    AND c.titulo_video = d.titulo_video
    AND c.nro_seq = d.nro_seq_comentario
WHERE c.is_online = 1
    AND d.STATUS = 'lido'
GROUP BY v.nome_canal, v.titulo, v.id_plataforma;

-- Query 5: Listar e ordenar os canais que mais recebem patrocínios e os valores recebidos.
SELECT p.nome_unico AS NomeCanal, COUNT(p.nome_unico) AS QtdPatrocinos, SUM(p.valor_patrocinio) as ValorRecebido
FROM Patrocinio p
GROUP BY p.nome_unico ORDER BY COUNT(p.nome_unico) DESC;

-- Query 6: Listar e ordenar os canais que mais recebem aportes de membros e os valores recebidos.
SELECT c.nome_unico AS Canal, TRUNCATE(SUM(n.valor_nivel), 2) AS ValorTotalAportes FROM Canal c
JOIN MNC m ON c.nome_unico = m.nome_canal AND c.id_plataforma = m.id_plataforma
JOIN Nivel n ON m.num_nivel = n.num_nivel AND m.nome_canal = n.nome_canal AND m.id_plataforma = n.id_plataforma
GROUP BY c.nome_unico, c.id_plataforma
ORDER BY ValorTotalAportes DESC;

-- Query 7: Listar e ordenar os canais que mais receberam doações considerando todos os vídeos.
SELECT c.nome_unico AS Canal, COALESCE(SUM(d.valor), 0) AS ValorDoacoes FROM Canal c
LEFT JOIN Donate d ON c.nome_unico = d.nome_canal AND c.id_plataforma = d.id_plataforma
WHERE d.STATUS != 'recusado' OR d.STATUS IS NULL
GROUP BY c.nome_unico, c.id_plataforma
ORDER BY ValorDoacoes DESC;

-- Query 8: Listar os canais que mais faturam considerando as três fontes de receita: patrocínio, membros inscritos e doações.
SELECT 
    c.nome_unico AS Canal,
    c.id_plataforma AS IdPlataforma,
    COALESCE(p.ValorTotalPatrocinio, 0) + COALESCE(d.ValorTotalDonate, 0) + COALESCE(n2.ValorTotalNivel, 0) AS TotalFaturamento
FROM Canal c
LEFT JOIN (
		SELECT id_plataforma, nome_unico, COALESCE(SUM(valor_patrocinio), 0) AS ValorTotalPatrocinio FROM Patrocinio
		GROUP BY id_plataforma, nome_unico
    ) p ON c.id_plataforma = p.id_plataforma AND c.nome_unico = p.nome_unico
LEFT JOIN (
		SELECT id_plataforma, nome_canal, COALESCE(SUM(valor), 0) AS ValorTotalDonate FROM Donate
        GROUP BY id_plataforma, nome_canal
	) d ON c.id_plataforma = d.id_plataforma AND c.nome_unico = d.nome_canal
LEFT JOIN (
		SELECT
			n.nome_canal, n.id_plataforma,
			TRUNCATE(COALESCE(SUM(n.valor_nivel), 0), 2) AS ValorTotalNivel
		FROM Nivel n
		JOIN MNC m ON n.nome_canal = m.nome_canal AND n.id_plataforma = m.id_plataforma
		GROUP BY m.nome_canal, m.id_plataforma
	) n2 ON c.id_plataforma = n2.id_plataforma AND c.nome_unico = n2.nome_canal
GROUP BY c.nome_unico, c.id_plataforma
ORDER BY TotalFaturamento DESC
