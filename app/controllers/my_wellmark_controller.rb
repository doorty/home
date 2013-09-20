class MyWellmarkController < ApplicationController
  before_action :set_care_circle

  def index
  end
  
  private
  
		def set_care_circle
			@care_circle = current_care_circle # CareCircle.find(params[:care_circle_id])
		end
		
end
