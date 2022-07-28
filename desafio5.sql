SELECT musica.musicas_nome AS cancao,
       COUNT(reproducao.musicas_id) AS reproducoes
FROM SpotifyClone.MUSICAS AS musica
      INNER JOIN SpotifyClone.HISTORICO_REPRODUCAO AS reproducao
ON reproducao.musicas_id = musica.musicas_id
GROUP BY musica.musicas_id
ORDER BY COUNT(reproducao.musicas_id) DESC, musica.musicas_nome LIMIT 2; 
