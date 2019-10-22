class SessionsController < Devise::SessionsController
    respond_to :json

    #Extend to generate CSRF token after successful login
    def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        render json: {logged_in: resource, csrf_token: form_authenticity_token}, status: :created
    end

    def destroy
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        respond_to_on_destroy
    end

    private

    #display log out response in JSON instead
    def respond_to_on_destroy
        render json: {status: 'Signed out successfully'}, status: :ok
    end
end