INSERT INTO luisa.cliente (nome)
VALUES ('Joao da Silva');

INSERT INTO luisa.cliente (nome)
VALUES ('Maria Souza');

INSERT INTO luisa.cliente (nome)
VALUES ('Carlos Lima');




INSERT INTO luisa.conta (tipo, saldo_atual, data_abertura, id_cliente)
VALUES ('conta corrente', 100.00, TO_DATE ('25/11/1997', 'DD/MM/YYYY'), 1);

INSERT INTO luisa.conta (tipo, saldo_atual, data_abertura, id_cliente)
VALUES ( 'poupanca', 20.000, TO_DATE ('26/12/2014', 'DD/MM/YYYY'), 2);

INSERT INTO luisa.conta (tipo, saldo_atual, data_abertura, id_cliente)
VALUES ('corrente', 50.00, TO_DATE ('20/01/1998','DD/MM/YYYY'), 3);



INSERT INTO luisa.transacao (tipo_transacao, valor, data, ID_conta_pagador, ID_conta_recebedor, status)
VALUES ('deposito', 1000.00, TO_DATE ('23/10/2025', 'DD/MM/YYYY'), 1, 1, 'aprovado');

INSERT INTO luisa.transacao (tipo_transacao, valor, data, ID_conta_pagador, ID_conta_recebedor, status)
VALUES ('transaferencia', 200.00, TO_DATE ('22/10/2025', 'DD/MM/YYYY'), 1, 2, 'cancelada');

INSERT INTO luisa.transacao (tipo_transacao, valor, data, ID_conta_pagador, ID_conta_recebedor, status)
VALUES ('saque', 100.00, TO_DATE ('20/09/2025', 'DD/MM/YYYY'), 2, 2, 'aprovado');

INSERT INTO luisa.transacao (tipo_transacao, VALOR, data, ID_conta_pagador, ID_conta_recebedor, status)
VALUES ('deposito', 500.00, TO_DATE ('19/10/2025', 'DD/MM/YYYY'), 3, 3, 'aprovado');


INSERT INTO luisa.cliente (email, TELEFONE, ENDERECO, CIDADE, UF, CEP, DOCUMENTO, TIPO)
VALUES ('joao@dasilva.com', '54996730337', 'rua quintino', 'chapeco', 'SC', '99730000', '3060636021', 'cpf');

INSERT INTO luisa.cliente (email, TELEFONE, ENDERECO, CIDADE, UF, CEP, DOCUMENTO, TIPO)
VALUES ('maria@souza.com', '4999751337', 'rua bocaiuva', 'chapeco', 'SC', '89802250', '306604454050', 'cnpj');

INSERT INTO luisa.cliente (email, TELEFONE, ENDERECO, CIDADE, UF, CEP, DOCUMENTO, TIPO)
VALUES ('carlos@lima.com', '33681223', 'rua da liberdade', 'jacutinga', 'RS', '99730250', '94985094', 'cnpj');  



 
(Desafio extra) Mostrar as contas que não tiveram nenhuma transação nos últimos 30 dias.

--Listar todas as contas com nome do cliente e saldo atual.
SELECT c.nome AS cliente, 
       co.saldo_atual
FROM luisa.conta co
JOIN luisa.cliente c
  ON co.id_cliente = c.id_cliente;

-- Mostrar todas as transações com nome do cliente origem e destino (se houver).
SELECT t.id_transacao,
       t.tipo_transacao,
       t.valor,
       t.data,
       c_pag.nome AS cliente_origem,
       c_rec.nome AS cliente_destino,
       t.status
FROM luisa.transacao t
LEFT JOIN luisa.conta co_pag
       ON t.id_conta_pagador = co_pag.id_conta
LEFT JOIN luisa.cliente c_pag
       ON co_pag.id_cliente = c_pag.id_cliente
LEFT JOIN luisa.conta co_rec
       ON t.id_conta_recebedor = co_rec.id_conta
LEFT JOIN luisa.cliente c_rec
       ON co_rec.id_cliente = c_rec.id_cliente;


--Calcular o total de dinheiro transferido por cada cliente.

SELECT c.nome AS cliente_origem,
       SUM(t.valor) AS total_transferido
FROM luisa.transacao t
JOIN luisa.conta co
   ON t.id_conta_pagador = co.id_conta
JOIN luisa.cliente c
   ON co.id_cliente = c.id_cliente
WHERE t.tipo_transacao = 'transferencia'
GROUP BY c.nome
ORDER BY total_transferido DESC;

--Mostrar o cliente com o maior saldo total (considerando todas as contas).
SELECT c.nome AS cliente,
       SUM(co.saldo_atual) AS saldo_total
FROM luisa.conta co
JOIN luisa.cliente c
   ON co.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY saldo_total DESC
FETCH FIRST 1 ROW ONLY;
