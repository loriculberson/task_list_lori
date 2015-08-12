class ListsController < ApplicationController

  def index
    @lists = List.order(created_at: :desc)
    @tasks = Task.all
  end

  def new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def export
    @lists = List.all
    @tasks = Task.order(:created_at)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.csv  { send_data @lists.to_csv + @tasks.to_csv }
    end
  end

  def import
    List.import(params[:file])
    flash[:notice] = "Tasks imported"
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end
end
