SELECT usua.usuario_Nome AS usuario, IF(MAX(YEAR(historico_reproducao.data_reproducao)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario 
FROM SpotifyClone.USUARIO AS usua,
     SpotifyClone.HISTORICO_REPRODUCAO AS historico_reproducao 
WHERE usua.usuario_id = historico_reproducao.usuario_id
GROUP BY usua.usuario_Nome
ORDER BY usua.usuario_Nome; 