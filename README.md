# Exlivery

**Aplicação de aprendizagem Elixir**

**RocketSeat - Ignite**

Aplicação de teste para uma API de delivery, onde é possível:

- Cadastrar usuários, items e pedidos
- Consultar os cadastros realizados
- Gerar um relatório (Arquivo .csv) com as informações dos pedidos.

Todas as rotinas criadas são contempladas com testes automatizados.

## Tech utilizadas

- Agent (para simular o banco de dados)

## Libs

- Decimal (lib para gerenciar valores)
- Exmachina (criação de factories para utilização nos testes automatizados)
- UUID (geração de números de ID aleatórios)
- Credo (Ferramenta para análise do código)

## IGNITE - ELIXIR

- Este material foi criado pelo professor [Rafael Camarda](https://github.com/RafaelCamarda) para o Bootcamp Ignite da [RocketSeat](http://www.rocketseat.com.br)

## Installation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exlivery](https://hexdocs.pm/exlivery).

```elixir
iex(212)> Flightex.get_user_by_cpf("00000")                               
{:ok,
 %Flightex.Users.User{
   cpf: "00000",
   email: "teste@email.com",
   id: "bc335b94-c2dc-42b0-918e-6ec5f2a924a2",
   name: "Andre"
 }}
iex(213)> Flightex.get_user_by_cpf("000000")
{:error, "User not found"}
iex(214)> Flightex.get_user_by_id("bc335b94-c2dc-42b0-918e-6ec5f2a92")   
{:error, "User not found"}
iex(215)> 
```
