class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         def configure_devise_parameters
  			devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:email,:role_id,:nom,:prenom)}
  		end
  	belongs_to :role
  	has_many :posts
end
