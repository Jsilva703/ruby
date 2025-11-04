# lib/gerenciador_de_tarefas.rb
# 1. Definimos a "Fábrica" (A Classe)
class GerenciadorDeTarefas

  # 2. O "Banco de Dados" (Uma lista compartilhada)
  @@tarefas = [
    { id: 1, descricao: "Comprar leite", concluida: false },
    { id: 2, descricao: "Estudar Ruby", concluida: true },
    { id: 3, descricao: "Estudar Rails", concluida: false }
  ]
  @@id_counter = 1

  @@pedidos = [
    { id: 1, item: "Pizza", quantidade: 2 },
    { id: 2, item: "Hambúrguer", quantidade: 1 },
    { id: 3, item: "Refrigerante", quantidade: 3 }
  ]

  # 3. A Ação "Listar" (Método de Classe)
  def self.listar
    return @@tarefas
  end

  def self.listar_pedidos
    return @@pedidos
  end

  # 4. A Ação "Adicionar" (Método de Classe)
  def self.adicionar(descricao_da_tarefa)
    nova_tarefa = {
      id: @@id_counter,
      descricao: descricao_da_tarefa,
      concluida: false
        
        }
    
         @@tarefas << nova_tarefa
         @@id_counter = @@id_counter + 1
    
        return nova_tarefa
  end

end # Fim da classe