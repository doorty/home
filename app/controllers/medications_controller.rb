class MedicationsController < ApplicationController
	before_action :set_care_circle
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  # GET /medications
  # GET /medications.json
  def index
    @medications = @care_circle.medications
  end

  # GET /medications/1
  # GET /medications/1.json
  def show
  end

  # GET /medications/new
  def new
    @medication = @care_circle.medications.new
    @medication.medication_reminders.build
    # 2.times { @medication.medication_reminders.build }
  end

  # GET /medications/1/edit
  def edit
  end

  # POST /medications
  # POST /medications.json
  def create
    @medication = @care_circle.medications.new(medication_params)

    respond_to do |format|
      if @medication.save
        format.html { redirect_to [@care_circle, @medication], notice: 'Medication was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medication }
      else
        format.html { render action: 'new' }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medications/1
  # PATCH/PUT /medications/1.json
  def update
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to [@care_circle, @medication], notice: 'Medication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1
  # DELETE /medications/1.json
  def destroy
    @medication.destroy
    respond_to do |format|
      format.html { redirect_to care_circle_medications_url }
      format.json { head :no_content }
    end
  end

  private
  
		def set_care_circle
			@care_circle = current_care_circle # CareCircle.find(params[:care_circle_id])
		end
    # Use callbacks to share common setup or constraints between actions.
    def set_medication
      @medication = @care_circle.medications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medication_params
      params.require(:medication).permit(:name, :strength, :dosage, :doctor_id, medication_reminders_attributes: [:id, :_destroy, {:days => []}, :time])
    end
end
