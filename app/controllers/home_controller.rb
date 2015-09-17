class HomeController < ApplicationController
	def index
		render layout: nil
	end

	def submit
		@project = Project.new
		render layout: 'submit'
	end

	def submitted
		@project = Project.new project_params

		if @project.valid? && verify_recaptcha(:model => @project, :message => "Sila pastikan anda adalah manusia!")
			@project.save
			render 'submitted', layout: 'submit'
  	else
  		render 'submit', layout: 'submit'
  	end
	end

	def project_params
		params.require(:project).permit(:name, :url, :description, :logo, :category, :developer_name, :developer_url, :submitter_name, :submitter_email, :submitter_phone)
	end
end
