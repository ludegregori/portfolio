# Enunciado gerado por chatgpt

💰 Desafio: Sistema de Contas e Transações Bancárias
Contexto

Você foi contratado por uma fintech que quer montar o banco de dados inicial para controlar clientes, contas e transações financeiras (depósitos, saques, transferências).

🎯 Regras de Negócio (para modelagem DER)

Um cliente pode ter uma ou mais contas.

Cada conta pertence a apenas um cliente.

Cada conta possui:

número da conta (único),

tipo (CORRENTE, POUPANÇA),

saldo atual,

data de abertura.

As transações registram movimentações de entrada e saída de dinheiro:

Uma transação está sempre associada a uma conta origem (quem envia) e, opcionalmente, a uma conta destino (quem recebe).

Cada transação tem tipo (DEPOSITO, SAQUE, TRANSFERENCIA), valor e data.

🧱 Tabelas sugeridas

CLIENTES

CONTAS

TRANSACOES

📥 Exemplo de inserts

Clientes:

João da Silva

Maria Souza

Carlos Lima

Contas:

João: conta corrente

Maria: poupança

Carlos: corrente

Transações:

João → depósito de R$ 1.000

João → transferência de R$ 200 para Maria

Maria → saque de R$ 100

Carlos → depósito de R$ 500

🔍 Consultas SQL para praticar

Listar todas as contas com nome do cliente e saldo atual.

Mostrar todas as transações com nome do cliente origem e destino (se houver).

Calcular o total de dinheiro transferido por cada cliente.

Mostrar o cliente com o maior saldo total (considerando todas as contas).

(Desafio extra) Mostrar as contas que não tiveram nenhuma transação nos últimos 30 dias.

## Ferramentas utilizadas
- Datamodeler
- Dbeaver
- Oracle 19c
- Chatgpt