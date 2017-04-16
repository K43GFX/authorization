class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to root_path, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

  def after_sign_in_path_for(user)
  	if current_user.has_role? :admin
      instances_path

  	elsif current_user.has_role? :student
  		instances_path
  	else
  		root_path
  	end
  end
end
