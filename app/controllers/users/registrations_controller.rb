class Users::RegistrationsController < Devise::RegistrationsController

  layout :resolve_layout


	def new
		build_resource({})
		self.resource.profile = Profile.new
    respond_with self.resource
		#super
	end

	def create
    self.resource = build_resource(sign_up_params)
    self.resource.role_ids = [Role.find_by_name(:patient.to_s).id] # only patients will sign up
    self.resource.care_circles.build()

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected
  
  def resolve_layout
  	case params[:action]
  	when "new", "create"
      "welcome"
    else
      "application"
    end
  end
  
  def after_sign_up_path_for(resource)
  	new_user_invitation_path # ask  user to invite people
  end                                                      

  
  def sign_up_params
    #params.require(:user).permit! # TODO: change to only specified parameters
    #params.require(:user).permit(:email, :password, :password_confirmation, {:role_ids => []} )
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:name] )
  end

end