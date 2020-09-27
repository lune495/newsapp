class FamillesController < ApplicationController
  before_action :set_famille, only: [:show, :edit, :update, :destroy]

  # GET /familles
  # GET /familles.json
  def index
    @familles = Famille.all
  end

  # GET /familles/1
  # GET /familles/1.json
  def show
  end

  # GET /familles/new
  def new
    @famille = Famille.new
  end

  # GET /familles/1/edit
  def edit
  end

  # POST /familles
  # POST /familles.json
  def create
    @famille = Famille.new(famille_params)

    respond_to do |format|
      if @famille.save
        format.html { redirect_to @famille, notice: 'Famille was successfully created.' }
        format.json { render :show, status: :created, location: @famille }
      else
        format.html { render :new }
        format.json { render json: @famille.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familles/1
  # PATCH/PUT /familles/1.json
  def update
    respond_to do |format|
      if @famille.update(famille_params)
        format.html { redirect_to @famille, notice: 'Famille was successfully updated.' }
        format.json { render :show, status: :ok, location: @famille }
      else
        format.html { render :edit }
        format.json { render json: @famille.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familles/1
  # DELETE /familles/1.json
  def destroy
    @famille.destroy
    respond_to do |format|
      format.html { redirect_to familles_url, notice: 'Famille was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_famille
      @famille = Famille.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def famille_params
      params.require(:famille).permit(:nom)
    end
end
