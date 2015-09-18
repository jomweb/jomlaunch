class ProjectsController < ApplicationController
	before_action :authenticate_user!
	layout 'application'

	def index
		@projects = Project.all
	end
end