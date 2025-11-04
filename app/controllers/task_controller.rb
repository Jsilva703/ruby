class TaskController < Sinatra::Base

    set :bind, '0.0.0.0'
    set :port, 4567

    before do
        content_type :json
    end

    get '/tasks' do
        tasks = Task.listar
        return tasks.to_json
    end

    post '/create/tasks' do
        request_payload = request.body.read

        task_data = JSON.parse(request_payload)

        new_task = Task.adicionar(task_data)

        status 201
        return new_task.to_json
    end

    delete '/delete/tasks/:id' do
        task_id = request.params[:id].to_i

        deleted_task = Task.delete(task_id)

        if deleted_task
            status 200
            return deleted_task.to_json
        else
            status 404
            return { error: "Tarefa não encontrada" }.to_json
        end
    end


end