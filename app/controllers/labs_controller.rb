class LabsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	def new
	end

	def index
		@labs = current_user.labs
	end
	def show
		@lab = Lab.find(params[:id])
	end
	def create
		@lab = Lab.new(lab_params)
		#@lab.user = current_user
		#@lab.instance = Instance.last
		@lab.user = User.first
		@lab.save!
		redirect_to @lab
	end

	private
	def lab_params
		params.require(:lab).permit(:title, :text)
	end
end
