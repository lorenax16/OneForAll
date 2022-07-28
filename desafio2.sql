
SELECT COUNT(DISTINCT mu.musicas_id) AS cancoes,
       COUNT(DISTINCT ar.artista_id) AS artistas,
       COUNT(DISTINCT al.album_id) AS albuns 
FROM SpotifyClone.MUSICAS AS mu,
     SpotifyClone.ALBUM AS al,
     SpotifyClone.ARTISTA as ar; 