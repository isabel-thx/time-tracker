class ReportsController < ApplicationController
  before_action :set_projects, only: [:index]

  def index
  end

  private
    def set_projects
      @projects = current_user.projects
    end
end