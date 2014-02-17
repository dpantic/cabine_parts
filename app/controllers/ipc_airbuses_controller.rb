class IpcAirbusesController < ApplicationController
  before_action :set_ipc_airbus, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


 def import
    IpcAirbus.import(params[:file])
    redirect_to ipc_airbuses_path, notice: "Airbus Data imported."
  end

  # GET /ipc_airbuses
  # GET /ipc_airbuses.json
  def index
    #@ipc_airbuses = IpcAirbus.
     @ipc_airbuses = IpcAirbus.order(sort_column + " " + sort_direction).search(params[:search])
  end

  # GET /ipc_airbuses/1
  # GET /ipc_airbuses/1.json
  def show
     @ipc_airbus = IpcAirbus.find(params[:id])
  end

  # GET /ipc_airbuses/new
  def new
    @ipc_airbus = IpcAirbus.new
  end

  # GET /ipc_airbuses/1/edit
  def edit
  end

  # POST /ipc_airbuses
  # POST /ipc_airbuses.json
  def create
    @ipc_airbus = IpcAirbus.new(ipc_airbus_params)

    respond_to do |format|
      if @ipc_airbus.save
        format.html { redirect_to @ipc_airbus, notice: 'IPC Airbus Data was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ipc_airbus }
      else
        format.html { render action: 'new' }
        format.json { render json: @ipc_airbus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ipc_airbuses/1
  # PATCH/PUT /ipc_airbuses/1.json
  def update
    respond_to do |format|
      if @ipc_airbus.update(ipc_airbus_params)
        format.html { redirect_to @ipc_airbus, notice: 'IPC Airbus Data was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ipc_airbus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ipc_airbuses/1
  # DELETE /ipc_airbuses/1.json
  def destroy
    @ipc_airbus.destroy
    respond_to do |format|
      format.html { redirect_to ipc_airbuses_url }
      format.json { head :no_content }
    end
  end

private

  def sort_column
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "id" 
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "ac_type" 
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "ata" 
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "system"
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "description"
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "part_number"
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "add_infos"
    IpcAirbus.column_names.include?(params[:sort]) ? params[:sort] : "ipc"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_ipc_airbus
    @ipc_airbus = IpcAirbus.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ipc_airbus_params
     if params[:ipc_airbus].present?
    params.require(:ipc_airbus).permit(:id, :ac_type, :ata, :system, :description, :fin, :add_infos, :part_number, :add_material_info, :ipc)
  end
 end
end
