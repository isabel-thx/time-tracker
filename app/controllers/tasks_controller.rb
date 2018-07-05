class TasksController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]

  def index
    @tasks = @project.tasks.order("created_at DESC")
  end

  def new
    if signed_in?
      @task = Task.new
    end
  end

  def create
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_tasks_path(@project.id), notice: 'New task added.' }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:user_id, :project_id, :name, :date, :start_time, :end_time)
    end
end