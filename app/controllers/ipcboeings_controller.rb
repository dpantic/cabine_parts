class IpcboeingsController < ApplicationController
  before_action :signed_in_user
  before_action :set_ipcboeing, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


  def import
    Ipcboeing.import(params[:file])
    redirect_to ipcboeings_path, notice: "Boeing Data imported!"
  end

  # GET /ipcboeings
  # GET /ipcboeings.json
  def index
   @ipcboeings = Ipcboeing.order(sort_column + " " + sort_direction).search(params[:search])
  end

  # GET /ipcboeings/1
  # GET /ipcboeings/1.json
  def show
    @ipcboeing = Ipcboeing.find(params[:id])
  end

  # GET /ipcboeings/new
  def new
    @ipcboeing = Ipcboeing.new
  end

  # GET /ipcboeings/1/edit
  def edit
  end

  # POST /ipcboeings
  # POST /ipcboeings.json
  def create
    @ipcboeing = Ipcboeing.new(ipcboeing_params)

    respond_to do |format|
      if @ipcboeing.save
        format.html { redirect_to @ipcboeing, notice: 'IPC Boeing List was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ipcboeing }
      else
        format.html { render action: 'new' }
        format.json { render json: @ipcboeing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ipcboeings/1
  # PATCH/PUT /ipcboeings/1.json
  def update
    respond_to do |format|
      if @ipcboeing.update(ipcboeing_params)
        format.html { redirect_to @ipcboeing, notice: 'IPC Boeing List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ipcboeing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ipcboeings/1
  # DELETE /ipcboeings/1.json
  def destroy
    @ipcboeing.destroy
    respond_to do |format|
      format.html { redirect_to ipcboeings_url }
      format.json { head :no_content }
    end
  end

private
  
  def sort_column
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "id" 
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "ac_type" 
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "ac_type" 
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "ata" 
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "system"
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "description"
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "part_number"
    Ipcboeing.column_names.include?(params[:sort]) ? params[:sort] : "ipc"
  end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ipcboeing
      @ipcboeing = Ipcboeing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ipcboeing_params
      if params[:ipcboeing].present?
      params.require(:ipcboeing).permit(:id, :ac_type, :ata, :system, :description, :location, :add_infos, :part_number, :add_material_info, :ipc)
     end
  end
end