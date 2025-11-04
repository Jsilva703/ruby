require 'bundler/setup'
Bundler.require


require_relative './app/models/task.rb'
require_relative './app/controllers/task_controller.rb'

TaskController.run!