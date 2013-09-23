class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Devise user accounts
  #before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
  private

  	def current_care_circle
  		@current_care_circle ||= CareCircle.find(session[:care_circle_id]) if session[:care_circle_id]
  	end
  	helper_method :current_care_circle # make it available inside views
  	
  	###############################################
    # Top Nav
    ###############################################
  	
  	def is_dashboard?
      #params[:controller] == 'care_circles'
      #params[:care_circle_id] || (params[:controller] == "care_circles")
      params[:controller] == "care_circles"
    end
    helper_method :is_dashboard?
    
    def is_my_account?
      params[:controller] == "users/registrations"  && params[:action] == "edit"
    end
    helper_method :is_my_account?
    
    def is_emergency?
      params[:controller] == "emergency"
    end
    helper_method :is_emergency?
    
    
    ###############################################
    # Side Nav
    ###############################################
    
    def is_doctor_tab?
      params[:controller] == "doctors"
    end
    helper_method :is_doctor_tab?
    
    def is_medications_tab?
      params[:controller] == "medications"
    end
    helper_method :is_medications_tab?
    
    def is_notes_tab?
      params[:controller] == "notes"
    end
    helper_method :is_notes_tab?
    
    def is_charts_tab?
      params[:controller] == "charts"
    end
    helper_method :is_charts_tab?
    
    def is_my_wellmark_tab?
      params[:controller] == "my_wellmark"
    end
    helper_method :is_my_wellmark_tab?
    
    def is_members_tab?
      params[:controller] == "members"
    end
    helper_method :is_members_tab?
    
    def is_new_members_tab?
      params[:controller] == "members"
    end
    helper_method :is_new_members_tab?
  
  protected

#     def configure_permitted_parameters
#       devise_parameter_sanitizer.for(:sign_up) do |u|
#         u.permit :role_ids, :email, :password, :password_confirmation
#       end
#     end
  
end
