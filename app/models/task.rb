class Task

    @@Tasks = [
        { id: 1, title: "Estudar Ruby", description: "Ler documentação e praticar exercícios", completed: false },
        { id: 2, title: "Fazer compras", description: "Comprar ingredientes para o jantar", completed: true },
        { id: 3, title: "Exercício físico", description: "Caminhada de 30 minutos no parque", completed: false }
    ]
    @@id = 4

    def self.listar
        return @@Tasks
    end

    def self.adicionar(descriction_task)
        nova_tarefa = {
            id: @@id,
            title: descriction_task["title"],
            description: descriction_task["description"],
            completed: false
        }
        @@Tasks << nova_tarefa
        @@id += 1

        return nova_tarefa
    end

    def self.delete(id_task)
        tarefa_removida = nil
        @@Tasks.each_with_index do |task, index|
            if task[:id] == id_task
                tarefa_removida = @@Tasks.delete_at(index)
                break
            end
        end
        return tarefa_removida
        
    end
    
end