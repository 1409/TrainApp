#Hier wird der User Auffgefordert sich anzumelden
class TrainingsplansController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_trainingsplan, only: [:edit, :update, :destroy]
  # GET /trainingsplans
  # GET /trainingsplans.json
  #Hier werden die Übungen nach zu erldigenden Übung und Abgeschlossen Übungen Aufgeteilt 
  def index
    if current_user
      @done = Trainingsplan.where(abgeschlossen: true, user_id: current_user.id)
      @todo = Trainingsplan.where(abgeschlossen: false, user_id: current_user.id)
      @done = Trainingsplan.where(abgeschlossen: true, user_id: current_user.id).order(created_at: :desc)
      @todo = Trainingsplan.where(abgeschlossen: false, user_id: current_user.id).order(updated_at: :desc)
    end
  end

  # GET /trainingsplans/new
  #Hier wird die Methode "Neue Übung" bezeichnet
  def new
    @trainingsplan = Trainingsplan.new
  end
  #Hier wird die MEthode Edit bezeichnet
  # GET /trainingsplans/1/edit
  def edit
  end

  # POST /trainingsplans
  # POST /trainingsplans.json
  #Hier wird die Create Methode bezeichnet und wer darauf Zugriff hat 
  def create
    @trainingsplan = current_user.trainingsplans.new(trainingsplan_params)
    @trainingsplan.user_id = current_user.id

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
  #Hier wird die Create Methode bezeichnet und wer darauf Zugriff hat 
  def update
    respond_to do |format|
      if @trainingsplan.update(trainingsplan_params)
        format.html { redirect_to trainingsplans_url, notice: 'Übung wurde erfolgreich upgedatet' }
        format.json { head :no_content }
      else
        format.html { render action: 'bearbeiten' }
        format.json { render json: @trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainingsplans/1
  # DELETE /trainingsplans/1.json
  #Hier wird die Löschen Methode bezeichnet 
  def destroy
    @trainingsplan.destroy
    respond_to do |format|
      format.html { redirect_to trainingsplans_url }
      format.json { head :no_content }
    end
  end
  #Hier wird eine Private Methode erstellt, sodass man nur seine eigene Übung ändern kann 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainingsplan
      @trainingsplan = Trainingsplan.find(params[:id])
      if @trainingsplan.user_id != current_user.id
        redirect_to trainingsplans_url, alert: 'Du kannst nur deinen eigenen Übungen ändern!.'
      end
    end
    #Hier wird angegeben das wenn man eine neue Übung erstellt man diese Parameter eintragen muss !
    # Never trust parameters from the scary internet, only allow the white list through.
    def trainingsplan_params
      params.require(:trainingsplan).permit(:uebung, :saetze, :wiederholungen, :abgeschlossen)
    end
  end
