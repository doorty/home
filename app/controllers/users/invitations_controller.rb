class Users::InvitationsController < Devise::InvitationsController
	def new
		super
  end
  
  def edit
  	self.resource.profile = Profile.new
  	@invited_by = User.find(self.resource.invited_by).profile.name
  	super
  end
  
  def update
    self.resource = resource_class.accept_invitation!(resource_params)
    @relationship = self.resource.relationships.build
    @relationship.relationship_type_id = params[:user][:relationship][:relationship_type]
    # TODO: create the care circle on invite.. then fill in user id and relationship type on sign up
    @relationship.care_circle_id = User.find(self.resource.invited_by).care_circles.first.id


    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                                        
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)
      respond_with resource, :location => after_accept_path_for(resource)
    else
      respond_with_navigational(resource){ render :edit }
    end
  end
  
  def create
    self.resource = resource_class.invite!(invite_params, current_inviter)
    self.resource.role_ids = [Role.find_by_name(:friends_family.to_s).id] # only friends/family are invited

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end
  
  def invite_fb_friends
  	raise params.to_yaml
  	#redirect_to user_invitation_path
  end
  
  
  protected                                                            

	def resource_params
		params.require(:user).permit(:invitation_token, :password, :password_confirmation, profile_attributes: [:name] )
	end
  
  def invite_params
    #params.require(:user).permit! # TODO: change to only specified parameters
    #params.require(:user).permit(:email, {:role_ids => []} )
    params.require(:user).permit(:email )
  end

  
end