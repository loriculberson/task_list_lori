class TasksController < ApplicationController

  def index
    @list = List.find(params[:list_id])
    if params[:status] == "Completed"
      @tasks = @list.tasks.where(status: "Completed").order(:id)
    elsif params[:start_date] == "future"
      @tasks = @list.tasks.future_task
    elsif params[:status] == "Incomplete"
      @tasks = @list.tasks.where(status: "Incomplete")
    else
      @tasks = @list.tasks.where(status: "Incomplete")
                          .where("start_date <=?", Date.today)
                          .order(:id)
    end
  end

  def show
     @task = Task.find(params[:id])
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      if request.xhr?
        head :no_content
      else
        redirect_to list_tasks_path
      end
    else
      render :edit
    end
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

  def delete_image
    task = Task.find(params[:task_id])
    task.image = nil
    task.save!
    redirect_to :back
  end

  private
  def task_params
    params.require(:task).permit(:title, :notes, :due_date,
                                  :start_date, :list_id, 
                                  :status, :image)

  end
end
