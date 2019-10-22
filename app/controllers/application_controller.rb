class ApplicationController < ActionController::API
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
    
    before_action :set_default_format

    private

    def set_default_format
        request.format = :json
    end
end
