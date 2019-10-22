class RegistrationsController < Devise::RegistrationsController  
    protect_from_forgery with: :exception, only: [:update, :delete]
    respond_to :json

    def create
        build_resource(sign_up_params)
        resource.save
        if resource.persisted?
            if resource.active_for_authentication?
                sign_up(resource_name, resource)
                respond_with resource, location: after_sign_up_path_for(resource)
            else
                expire_data_after_sign_in!
                respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
        else
            clean_up_passwords resource
            set_minimum_password_length
            respond_with resource
        end
    end

    def update
        self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
        prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
        resource_updated = update_resource(resource, account_update_params)
        if resource_updated
          bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
          respond_with resource, location: after_update_path_for(resource)
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
    end

    def destroy
        resource.destroy
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    end
    
end  