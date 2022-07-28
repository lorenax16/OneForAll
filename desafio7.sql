SELECT artist.artista_nome AS artista,
       albums.album_nome AS album,
       COUNT(seguindo.usuario_id) AS seguidores
FROM SpotifyClone.ARTISTA AS artist
      INNER JOIN SpotifyClone.ALBUM AS albums
ON artist.artista_id = albums.artista_id
      INNER JOIN SpotifyClone.SEGUINDO_ARTISTA AS seguindo
ON artist.artista_id = seguindo.artista_id
GROUP BY artist.artista_id, albums.album_id
ORDER BY COUNT(seguindo.usuario_id) DESC, artist.artista_nome, albums.album_nome;


