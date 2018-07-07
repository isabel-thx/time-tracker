module ReportsHelper
  def all_tasks(project)
    return project.tasks.by_month(params[:month].to_i + 1) if params[:month]
    project.tasks
  end
end