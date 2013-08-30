class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def create
		#raise request.env["omniauth.auth"].to_yaml
		auth = request.env["omniauth.auth"]
		current_user.authentications.where(:provider => auth.provider, :uid => auth.uid).first_or_create do |user|
		  user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
		end
		flash[:notice] = "Successfully signed in to " + auth.provider
		redirect_to new_user_invitation_path
	end
	
	def destroy
		user = current_user.omniauth_providers.find(params[:id])
		user.destory
		flash[:notice] = "Signed out"
		redirect_to new_user_invitation_path
	end
	
	alias_method :facebook, :create
end
