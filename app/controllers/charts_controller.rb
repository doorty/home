class ChartsController < ApplicationController
	before_action :set_care_circle
  before_action :set_chart, only: [:show, :edit, :update, :destroy]

  # GET /charts
  # GET /charts.json
  def index
    @charts = @care_circle.charts.all
  end

  # GET /charts/1
  # GET /charts/1.json
  def show
  end

  # GET /charts/new
  def new
    @chart = @care_circle.charts.new
  end

  # GET /charts/1/edit
  def edit
  end

  # POST /charts
  # POST /charts.json
  def create
    @chart = @care_circle.charts.new(chart_params)

    respond_to do |format|
      if @chart.save
        format.html { redirect_to [@care_circle, @chart], notice: 'Chart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chart }
      else
        format.html { render action: 'new' }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charts/1
  # PATCH/PUT /charts/1.json
  def update
    respond_to do |format|
      if @chart.update(chart_params)
        format.html { redirect_to [@care_circle, @chart], notice: 'Chart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charts/1
  # DELETE /charts/1.json
  def destroy
    @chart.destroy
    respond_to do |format|
      format.html { redirect_to care_circle_charts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_circle
			@care_circle = current_care_circle # CareCircle.find(params[:care_circle_id])
		end
		
    def set_chart
      @chart = Chart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chart_params
      params.require(:chart).permit(:care_circle_id)
    end
end
