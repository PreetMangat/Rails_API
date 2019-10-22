class ApplicationController < ActionController::API
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection

    before_action :set_default_format

    protected

        def set_csrf_cookie
            cookies["CSRF-TOKEN"] = form_authenticity_token
        end

        def delete_csrf_cookie
            cookies.delete("CSRF-TOKEN")
        end

    private

        def set_default_format
            request.format = :json
        end
end
