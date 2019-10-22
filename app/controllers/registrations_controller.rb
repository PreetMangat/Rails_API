class RegistrationsController < Devise::RegistrationsController  
    respond_to :json
    prepend_before_action :set_csrf_cookie , only: [:update,:destroy]
    protect_from_forgery only: [:update,:destroy] , prepend: true
    
end  