class Users::SessionsController < Devise::SessionsController

  layout 'welcome'

#   def new
#     self.resource = resource_class.new(sign_in_params)
#     clean_up_passwords(resource)
#     respond_with(resource, serialize_options(resource))
#   end
# 
#   # POST /resource/sign_in
#   def create
#     self.resource = warden.authenticate!(auth_options)
#     set_flash_message(:notice, :signed_in) if is_navigational_format?
#     sign_in(resource_name, resource)
#     respond_with resource, :location => after_sign_in_path_for(resource)
#   end

end