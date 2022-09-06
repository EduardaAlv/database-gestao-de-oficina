--Consulta do nome e da data de criação das tabelas do banco de dados
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT name, create_date FROM sys.tables 
order by name desc


--Consulta das tabelas e colunas do banco de dados
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT t.name, c.name, ti.is_table_type, c.max_length
FROM sys.tables AS t
INNER JOIN sys.columns AS c ON t.object_id = c.object_id
INNER JOIN sys.types  as TI ON  c.system_type_id = ti.user_type_id
order by t.name, c.name


--Consulta das tabelas, colunas e indíces do banco de dados
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
SELECT
i.name AS NomeDoIndice,
t.name AS NomeDaTabela
FROM sys.dm_db_partition_stats AS s
INNER JOIN sys.indexes AS i ON s.object_id = i.object_id
AND s.index_id = i.index_id
AND i.type > 0
INNER JOIN sys.tables t ON t.OBJECT_ID = i.object_id
GROUP BY i.name, t.name
ORDER BY i.name, t.name

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------