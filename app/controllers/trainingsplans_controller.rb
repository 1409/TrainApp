class TrainingsplansController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # GET /trainingsplans
  # GET /trainingsplans.json
  def index
    @done = Trainingsplan.where(abgeschlossen: true)
    @todo = Trainingsplan.where(abgeschlossen: false)
    @done = Trainingsplan.where(abgeschlossen: true).order(created_at: :desc)
    @todo = Trainingsplan.where(abgeschlossen: false).order(updated_at: :desc)
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
    @trainingsplans = current_user.trainingsplans.new(trainingsplans_params)

    respond_to do |format|
      if @trainingsplan.save
        format.html { redirect_to trainingsplans_url, notice: 'Eine neue Übung wurde erfolgreich erstellt' }        
        format.json { render action: 'Zeigen', status: :created, location: @trainingsplan }
      else
        format.html { render action: 'Neue Übung' }
        format.json { render json: @trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainingsplans/1
  # PATCH/PUT /trainingsplans/1.json
  def update
    respond_to do |format|
      if @trainingsplan.update(trainingsplan_params)
        format.html { redirect_to trainingsplans_url, notice: 'Übung wurder erfolgreich upgedatet' }
        format.json { head :no_content }
      else
        format.html { render action: 'bearbeiten' }
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
      @trainingsplans = trainingsplans.find(params[:id])
      if @trainingsplan.user_id != current_user.id
        redirect_to trainingsplans_url, alert: 'You can edit only your own Tasks.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainingsplan_params
      params.require(:trainingsplan).permit(:uebung, :saetze, :wiederholungen, :abgeschlossen)
    end
  end
