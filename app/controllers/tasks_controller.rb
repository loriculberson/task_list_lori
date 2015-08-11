class TasksController < ApplicationController

  def index
    list = List.find(params[:list_id])
    @tasks = list.tasks
  end

  def new
  end

  def create
    list = List.find(params[:list_id])
    @task = list.tasks.new(task_params)

    if @task.save
      redirect_to list_tasks_path
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :notes, :due_date,
                                  :start_date, :list_id, 
                                  :status)

  end
end
