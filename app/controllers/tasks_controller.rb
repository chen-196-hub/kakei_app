class TasksController < ApplicationController
  before_action :authenticate_user,{only:[:index]}

  def index
    @todolist = Task.where(user_id: session[:user_id])
  end
  def create
    @task = Task.new(
      content:params[:content],
      user_id:session[:user_id]
    )
    if @task.save
    redirect_to("/tasks/index")
    end
  end
  def edit
    @task = Task.find_by(id: params[:id])
  end
  def update
    @task = Task.find_by(id: params[:id])
    @task.content = params[:content]
    @task.save
    flash[:notice] = "編集完了"
    redirect_to("/tasks/index")
  end
  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to("/tasks/index")
  end
  def done_index
    @done_list = DoneTask.where(user_id: session[:user_id]).order(created_at: :desc)
  end
  def task_done
    @task = Task.find_by(id:params[:id])
    @done_list = DoneTask.new(content:@task.content,user_id:@task.user_id)
    @done_list.save
    @task.destroy
    redirect_to("/tasks/index")
  end
  def undone
    @undonetask = DoneTask.find_by(id: params[:id])
    @task = Task.new(content:@undonetask.content,user_id:@undonetask.user_id)
    @task.save 
    @undonetask.destroy
    redirect_to("/tasks/index")
  end
  def done_task_destroy
    @task = DoneTask.find_by(id:params[:id])
    @task.destroy 
    redirect_to('/tasks/done_index')
  end

  
  
end
