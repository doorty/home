class DashboardController < ApplicationController
  def index
  
  	@care_circles = []
  
  	if current_user.care_circles.blank?
  		# create or assign on to user
  		if current_user.invited_by_id
  			@care_circles = User.find_by_id(current_user.invited_by_id).care_circles
  		end
  		
  	else
  		# if more than one, let user select one
  		# otherwise, display the only one
  		@care_circles = current_user.care_circles
  	end
  	
  	if @care_circles.blank?
  		# TODO: redirect to page where you can set/create care circle
  		current_user.care_circles.create()
  		@care_circles = current_user.care_circles
  	end
  		
  	@care_circle = @care_circles.first
  	#@status = current_user.care_circle.communication
  end
  
  # see: http://www.railsexperiments.com/using-strong-parameters-with-nested-forms/
  def new_status_params
    params.require(:communication).permit(  status_attributes: [:message] )
  end
  
end
