class TrainingsplansController < ApplicationController
  before_action :set_trainingsplan, only: [:show, :edit, :update, :destroy]

  # GET /trainingsplans
  # GET /trainingsplans.json
  def index
    @trainingsplans = Trainingsplan.all
  end

  # GET /trainingsplans/1
  # GET /trainingsplans/1.json
  def show
  end

  # GET /trainingsplans/new
  def new
    @trainingsplan = Trainingsplan.new
  end

  # GET /trainingsplans/1/edit
  def edit
  end

  # POST /trainingsplans
  # POST /trainingsplans.json
  def create
    @trainingsplan = Trainingsplan.new(trainingsplan_params)

    respond_to do |format|
      if @trainingsplan.save
        format.html { redirect_to @trainingsplan, notice: 'Trainingsplan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trainingsplan }
      else
        format.html { render action: 'new' }
        format.json { render json: @trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainingsplans/1
  # PATCH/PUT /trainingsplans/1.json
  def update
    respond_to do |format|
      if @trainingsplan.update(trainingsplan_params)
        format.html { redirect_to @trainingsplan, notice: 'Trainingsplan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainingsplans/1
  # DELETE /trainingsplans/1.json
  def destroy
    @trainingsplan.destroy
    respond_to do |format|
      format.html { redirect_to trainingsplans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainingsplan
      @trainingsplan = Trainingsplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainingsplan_params
      params.require(:trainingsplan).permit(:uebung, :saetze, :wiederholungen, :abgeschlossen)
    end
end
