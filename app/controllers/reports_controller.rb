class ReportsController < ApplicationController
  before_action :set_projects, only: [:index]

  private
    def set_projects
      @projects = current_user.projects.includes(:tasks)
    end
end