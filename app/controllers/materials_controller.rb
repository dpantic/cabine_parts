class MaterialsController < ApplicationController
  before_action :signed_in_user
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


def import
    Material.import(params[:file])
    redirect_to materials_path, notice: "Material List imported!"
  end
  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.order(sort_column + " " + sort_direction).search(params[:search])
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render action: 'show', status: :created, location: @material }
      else
        format.html { render action: 'new' }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url }
      format.json { head :no_content }
    end
  end

  private
    def sort_column
     Material.column_names.include?(params[:sort]) ? params[:sort] : "id" 
     Material.column_names.include?(params[:sort]) ? params[:sort] : "product_type" 
     Material.column_names.include?(params[:sort]) ? params[:sort] : "description"
     Material.column_names.include?(params[:sort]) ? params[:sort] : "add_infos" 
     Material.column_names.include?(params[:sort]) ? params[:sort] : "mat_nr" 
     Material.column_names.include?(params[:sort]) ? params[:sort] : "part_number"
   end
 
   def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      if params[:material].present?
      params.require(:material).permit(:id, :product_type, :description, :add_infos, :mat_nr, :part_number)
    end
  end
end
