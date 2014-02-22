class SpmsController < ApplicationController
  before_action :signed_in_user
  before_action :set_spm, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
 
  def import
    Spm.import(params[:file])
    redirect_to spms_path, notice: "SPM Ref. Imported!"
  end

  # GET /spms
  # GET /spms.json
  def index
    @spms = Spm.order(sort_column + " " + sort_direction).search(params[:search])
  end
 
  # GET /spms/1
  # GET /spms/1.json
  def show
    @spm = Spm.find(params[:id])
  end
 
  # GET /spms/new
  def new
    @spm = Spm.new
  end
 
  # GET /spms/1/edit
  def edit
  end
 
  # POST /spms
  # POST /spms.json
  def create
    @spm = Spm.new(spm_params)
 
    respond_to do |format|
      if @spm.save
        format.html { redirect_to @spm, notice: 'SPM-List was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spm }
      else
        format.html { render action: 'new' }
        format.json { render json: @spm.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # PATCH/PUT /spms/1
  # PATCH/PUT /spms/1.json
  def update
    respond_to do |format|
      if @spm.update(spm_params)
        format.html { redirect_to @spm, notice: 'SPM-List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spm.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /spms/1
  # DELETE /spms/1.json
  def destroy
    @spm.destroy
    respond_to do |format|
      format.html { redirect_to spms_url }
      format.json { head :no_content }
    end
  end
 
  private
   def sort_column
    Spm.column_names.include?(params[:sort]) ? params[:sort] : "id" 
    Spm.column_names.include?(params[:sort]) ? params[:sort] : "spm_ref" 
    Spm.column_names.include?(params[:sort]) ? params[:sort] : "bauteil" 
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_spm
      @spm = Spm.find(params[:id])
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def spm_params
     if params[:spm].present?
      params.require(:spm).permit(:spm_ref, :bauteil)
     end
    end
end