class ProjectsController < ApplicationController
  def index
    if signed_in?
      @projects = current_user.projects.order("created_at DESC")
    end
  end

  def new
    if signed_in?
      @projects = current_user.projects.order("created_at DESC")
      @project = Project.new
    end
  end

  def create
    @project = current_user.projects.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to user_projects_path(current_user), notice: 'New project created.' }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :name, :hourly_rate)
    end
end