class HomeController < ApplicationController
	def index
		render layout: nil
	end

	def submit
		@project = Project.new
		render layout: 'submit'
	end
end
