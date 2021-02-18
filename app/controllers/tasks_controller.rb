class TasksController < ApplicationController
  def index
    @todolist = Task.all
  end
  def create
    @task = Task.new(content:params[:content])
    if @task.save
    redirect_to("/tasks/index")
    end
  end
  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to("/tasks/index")
  end
end
