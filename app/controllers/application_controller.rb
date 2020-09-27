class ApplicationController < ActionController::Base
	before_action :configure_devise_parameters, if: :devise_controller?
	def configure_devise_parameters
     devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:email,:prenom,:nom,:password,:password_confirmation,:role_id)}
  	end

  	def after_sign_in_path_for(resource)
  		posts_path
	end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to posts_path, notice: 'Accés interdit'
	end
end
