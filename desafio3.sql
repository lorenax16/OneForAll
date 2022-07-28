SELECT us.usuario_Nome AS usuario,
      COUNT(historico_reproducao.usuario_id) AS qtde_musicas_ouvidas,
      ROUND(SUM(s.duracao_segundos)/60, 2) AS total_minutos
FROM SpotifyClone.USUARIO AS us
		INNER JOIN SpotifyClone.HISTORICO_REPRODUCAO AS historico_reproducao
		INNER JOIN SpotifyClone.MUSICAS AS s
ON us.usuario_id = historico_reproducao.usuario_id AND s.musicas_id = historico_reproducao.musicas_id
GROUP BY us.usuario_id
ORDER BY us.usuario_Nome; 
