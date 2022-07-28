SELECT artist.artista_nome AS artista,
	   albums.album_nome AS album
FROM SpotifyClone.ARTISTA AS artist
      INNER JOIN SpotifyClone.ALBUM AS albums 
ON artist.artista_id = albums.artista_id AND artist.artista_nome= 'Walter Phoenix'
ORDER BY albums.album_nome; 
