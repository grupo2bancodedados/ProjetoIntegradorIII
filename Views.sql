create view Plano_custos as (
select * 
from categorias c
left join subcategorias s using (id_categoria)
order by id_categoria,  id_subcategoria
)
;

create view Extrato as (
WITH BASE AS (
select nome_conta, 
       coalesce(nome_categoria, nome_subcategoria) transacao, 
       case when tipo_transacao = 'D' THEN VALOR_TRANSACAO *-1 ELSE VALOR_TRANSACAO END VALOR,
       descricao, 
       data_transacao, 
       id_transacao
from contas
join transacoes using(id_conta)
join categorias using(id_categoria)
LEFT join subcategorias using(id_subcategoria)
)
SELECT B.*, 
       SUM(VALOR) OVER (ORDER BY DATA_TRANSACAO , id_transacao) SALDO_GERAL,
       SUM(VALOR) OVER (PARTITION BY NOME_CONTA ORDER BY DATA_TRANSACAO , id_transacao) SALDO_POR_CONTA
FROM BASE B
ORDER BY DATA_TRANSACAO , id_transacao
);

