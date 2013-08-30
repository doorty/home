class DoctorsController < ApplicationController
  before_action :set_care_circle
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = @care_circle.doctors.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = @care_circle.doctors.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = @care_circle.doctors.new(doctor_params)
    
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to [@care_circle, @doctor], notice: 'Doctor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @doctor }
      else
        format.html { render action: 'new' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to [@care_circle, @doctor], notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to care_circle_doctors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_circle
			@care_circle = current_care_circle # CareCircle.find(params[:care_circle_id])
		end
		
    def set_doctor
      @doctor = @care_circle.doctors.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:care_circle_id, :name, :phone, :address, :city, :state)
    end
end
