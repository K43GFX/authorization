class InstancesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	def new
	end

	def index
		@instances = current_user.instances
	end

	def show
		@instance = Instance.find(params[:id])
	end

	def all
		@instances = Instance.all
	end
	def create
		@instance = Instance.new(instance_params)
		@instance.user = current_user
		@instance.save!
		redirect_to instances_path
	end

	def destroy
  		@instance = Instance.find(params[:id])
  		@instance.destroy
 
  		redirect_to instances_path
	end
	private
	def instance_params
		params.require(:instance).permit(:title, :text)
	end
end
