class CareCirclesController < ApplicationController
  before_action :set_care_circle, only: [:edit, :update, :destroy]

  # GET /care_circles
  # GET /care_circles.json
  def index
    @care_circles = current_user.care_circles
    number_of_care_circles = @care_circles.length
    if (number_of_care_circles > 0)
    	# no point in wasting time selecting care circle if there is only one
			redirect_to @care_circles.first if number_of_care_circles == 1
		else
			redirect_to new_care_circle_path
    end
	end

  # GET /care_circles/1
  # GET /care_circles/1.json
  def show
  if (params[:id])
    session[:care_circle_id] = params[:id]
  end
  	
  	@care_circle = current_care_circle
  	
  	@medications = @care_circle.medications
  	
  	@status = @care_circle.statuses.new
  	@appointment = @care_circle.appointments.new
  	@activities = activities(params[:id])
  	
  	
  end

  # GET /care_circles/new
  def new
  	if current_user.role?(:patient)
  		# automatically create care circle for patient (without existing care circle)
  		if current_user.care_circles.length == 0
  			@care_circle = current_user.care_circles.new
  			@care_circle.relationships.build(:user => current_user) #, :relationship_type_id => RelationshipType.find_by_name("Patient").id
  			respond_to do |format|
	      if @care_circle.save
	        format.html { redirect_to @care_circle, notice: 'Care circle was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @care_circle }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @care_circle.errors, status: :unprocessable_entity }
	      end
	    end
	    else
	    	# obviously
	    	@care_circle = current_user.care_circles.new
	    end
	  else
			@care_circle = current_user.care_circles.new
  	end	
  		
    
  end

  # GET /care_circles/1/edit
  def edit
  end

  # POST /care_circles
  # POST /care_circles.json
  def create
    @care_circle = current_user.care_circles.new(care_circle_params)
    relationship = @care_circle.relationships.build
    relationship.user = current_user
    # TODO: figure out why I can't do this with strong parameters (Unpermitted parameters: relationship)
    relationship.relationship_type_id = params[:care_circle][:relationship][:relationship_type]

    respond_to do |format|
      if @care_circle.save
        format.html { redirect_to @care_circle, notice: 'Care circle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @care_circle }
      else
        format.html { render action: 'new' }
        format.json { render json: @care_circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /care_circles/1
  # PATCH/PUT /care_circles/1.json
  def update
    respond_to do |format|
      if @care_circle.update(care_circle_params)
        format.html { redirect_to @care_circle, notice: 'Care circle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @care_circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /care_circles/1
  # DELETE /care_circles/1.json
  def destroy
    @care_circle.destroy
    respond_to do |format|
      format.html { redirect_to care_circles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_circle
      @care_circle = current_care_circle # current_user.care_circles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def care_circle_params
      #params[:care_circle]
      #params.require(:care_circle).permit(relationship_attributes: [:relationship_type])
      params.require(:care_circle).permit(relationship_attributes: [:relationship_type])
    end
    
    def activities(care_circle_id)
    	
			care_circle = @care_circle
			limit = 10
			activities = []
			sorted_activities = []
			activities += care_circle.statuses.all(:order => 'created_at DESC', :limit => limit).map do |status|
			  Activity.new(:status, current_user.profile.name, status.message, status.created_at)
			end
			
			activities += care_circle.appointments.all(:order => 'date DESC', :limit => limit).map do |appointment|
			  Activity.new(:appointment, appointment.title, nil, appointment.date)
			end
			
			activities += care_circle.notes.all(:order => 'created_at DESC', :limit => limit).map do |note|
			  Activity.new(:note, note.content, nil, note.created_at)
			end
			
			activities += care_circle.medications.all(:order => 'created_at DESC', :limit => limit).map do |medication|
			  Activity.new(:medication, medication.name, "Take #{medication.dosage} at #{medication.strength}", medication.medication_reminders.first.try(:time))
			end
			
			# activities += Message.all(:conditions => ['receiver_id = ?', current_user.id], :order => 'created_at DESC', :limit => limit).map do |message|
			#   Activity.new(message.title, message.text, message.created_at)
			# end
			
			# descending sort by 'date' field
			
			sorted_activities = activities.sort_by(&:date).reverse if activities.nil? == false
			
			# 10 most recent elements across all models
			if sorted_activities.length > 0
				return sorted_activities[0..(limit-1)]
			else
				return sorted_activities
			end
    end
    
end
