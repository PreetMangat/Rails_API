class RegistrationsController < Devise::RegistrationsController  
    protect_from_forgery with: :exception, only: [:update, :delete]
    respond_to :json
end  