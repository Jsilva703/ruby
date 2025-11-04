# app.rb (na raiz!)

require 'sinatra'
require 'json' # Vamos precisar de JSON para a API

# 1. "Importe" o Cérebro!
#    'require_relative' significa "procure a partir DESTE arquivo"
#    Estamos "olhando" para dentro da pasta 'lib'
require_relative './lib/gerenciador_task.rb'

# --- NOSSAS "PORTAS" (Endpoints) ---

# Rota 1: Listar todas as tarefas (GET)
get '/tarefas' do
  # 1. Chama o "Cérebro"
  lista_de_tarefas = GerenciadorDeTarefas.listar

  # 2. Responde em JSON
  content_type :json
  return lista_de_tarefas.to_json
end

post '/tarefas' do

    request.body.rewind  # Garantir que estamos no início do corpo da requisição
    dados_brutos = request.body.read # Ler o corpo da requisição

    dados_json = JSON.parse(dados_brutos) # Parsear o JSON recebido
    descricao_da_tarefa = dados_json["descricao"] # Extrair a descrição da tarefa

    nova_tarefa = GerenciadorDeTarefas.adicionar(descricao_da_tarefa)

    content_type :json
    status 201
    return nova_tarefa.to_json
end

# Rota 2: O "Hello World" (só para testar)
get '/teste' do
  "A arquitetura está funcionando! 🚀"
end

get '/pedidos' do
  lista_de_pedidos = GerenciadorDeTarefas.listar_pedidos

  content_type :json
  return lista_de_pedidos.to_json
end