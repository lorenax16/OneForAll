SELECT MIN(plan.valor) AS faturamento_minimo,
	   MAX(plan.valor) AS faturamento_maximo, 
       ROUND(AVG(plan.valor), 2) AS faturamento_medio,
       SUM(plan.valor) AS faturamento_total
FROM SpotifyClone.PLANO AS plan
	 INNER JOIN SpotifyClone.USUARIO AS usua
WHERE plan.plano_id = usua.plano_id; 