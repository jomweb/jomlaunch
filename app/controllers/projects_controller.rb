class ProjectsController < ApplicationController
  before_action :authenticate_user!
  layout 'application'

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
  end
end