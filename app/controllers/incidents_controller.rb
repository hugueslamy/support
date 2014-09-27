class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :show, :index]

  # GET /incidents
  # GET /incidents.json
  def index
    redirect_to new_incident_path and return unless current_user
    unless params[:filter].nil?
      # Not very safe. Could be improved
      @incidents = Incident.send(params[:filter].to_sym)
    else
      @incidents = Incident.all
    end
    
    if stale?(@incidents, public: true)
      expires_in 5.minutes, public: true
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @incidents }
      end
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    @comment = Comment.new
    @activities = PublicActivity::Activity.where(trackable: @incident)
    if stale?(@incident, public: true)
      expires_in 5.minutes, public: true
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @incident }
      end
    end    
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)

    respond_to do |format|
      if @incident.save
        @incident.create_activity key: 'activity.incident.created', owner: current_user
        IncidentMailer.created(@incident).deliver
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        @incident.create_activity key: 'activity.incident.updated', owner: current_user
        IncidentMailer.updated(@incident).deliver      
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      if params[:code]
        @incident = Incident.find_by_code(params[:code])
      else
        @incident = Incident.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:requestor_name, :requestor_email, :departement_id, :title, :body, :assignee_id, :status_id)
    end
end
