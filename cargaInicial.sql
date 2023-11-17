-- SET SQL_SAFE_UPDATES=0;
;
-- start transaction 
;
insert into estados 
(uf_estado,uf_nome)
VALUES
('MG', 'Minas Gerais')
;
INSERT INTO usuarios
(nome_usuario, email_usuario, genero_usuario, data_nasc_usuario, uf_estado, senha_usuario)
VALUES
('usuario testes','teste@teste.com','M','77/09/24','MG',  md5('minha nova senha'))
;

insert into contas
(nome_conta,id_usuario)
select 'carteira', 1 union
select 'banco Inter', 1 union
select 'bnco Investimentos', 1
;
;
insert into categorias
(nome_categoria)
select 'Casa' union
select 'Educação' union
select 'Veiculo' union
select 'Receitas' union
select 'Transporte' union 
select 'Transferecias'
;

insert into subcategorias
(nome_subcategoria, id_categoria)
select 'Água', 1 union
select 'Luz', 1 union
select'Gás', 1 union
select 'Mercado', 1 union
select 'Faculdade', 2 union
select 'Livros/Revistas', 2 union
select 'Combustivel', 3 union
select 'Manutenção', 3 union
select 'Salário', 4 union
select 'Investimentos',  4 union
select 'Bicos', 4 union
select 'Ônibus', 5 union
select 'Uber/99', 5 
;

CALL insert_transacao(2, 4, 8, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 1 DAY), 3500, 'salário mensal', 12, 'M', 'C');
CALL insert_transacao(2, 1, 1, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 2 DAY), 90.75, 'copasa', 12, 'M', 'D');
CALL insert_transacao(2, 1, 2, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 2 DAY), 200.15, 'cemig', 12, 'M', 'D');
CALL insert_transacao(2, 1, 3, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 2 DAY), 110, 'gás bras', 12, 'M', 'D');
CALL insert_transacao(2, 1, 4, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 1110, 'provisão supermercado', 12, 'M', 'D');

CALL insert_transacao(2, 2, 4, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 200, 'Senac', 12, 'M', 'D');
CALL insert_transacao(2, 2, 5, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 200, 'Livro didático', 1, 'M', 'D');

CALL insert_transacao(2, 6, null, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 500, 'para gastos gerais', 12, 'M', 'D');
CALL insert_transacao(1, 6, null, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 500, 'para gastos gerais', 12, 'M', 'C');
CALL insert_transacao(1, 4, 11, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 300, 'com busão', 12, 'M', 'D');

CALL insert_transacao(2, 6, null, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 500, 'para gastos gerais', 12, 'M', 'D');
CALL insert_transacao(3, 6, null, DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 5 DAY), 500, 'para gastos gerais', 12, 'M', 'C');
