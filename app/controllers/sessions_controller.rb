class SessionsController < Devise::SessionsController
    respond_to :json

    #Extend to generate CSRF token after successful login
    def create
        super { |resource| set_csrf_cookie }
    end

    #Extend to delete CSRF token after successful logout
    def destroy
        super { delete_csrf_cookie }
    end

    private

    #display log out response in JSON instead
    def respond_to_on_destroy
        render json: {status: 'Signed out successfully'}, status: :ok
    end
end