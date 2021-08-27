class TemporadaCapitulosController < ApplicationController
  before_action :set_temporada_capitulo, only: %i[ show edit update destroy ]

  # GET /temporada_capitulos or /temporada_capitulos.json
  def index
    @temporada_capitulos = TemporadaCapitulo.all
  end

  # GET /temporada_capitulos/1 or /temporada_capitulos/1.json
  def show
  end

  # GET /temporada_capitulos/new
  def new
    @temporada_capitulo = TemporadaCapitulo.new
  end

  # GET /temporada_capitulos/1/edit
  def edit
  end

  # POST /temporada_capitulos or /temporada_capitulos.json
  def create
    @temporada_capitulo = TemporadaCapitulo.new(temporada_capitulo_params)

    respond_to do |format|
      if @temporada_capitulo.save
        format.html { redirect_to @temporada_capitulo, notice: "Temporada capitulo was successfully created." }
        format.json { render :show, status: :created, location: @temporada_capitulo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temporada_capitulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temporada_capitulos/1 or /temporada_capitulos/1.json
  def update
    respond_to do |format|
      if @temporada_capitulo.update(temporada_capitulo_params)
        format.html { redirect_to @temporada_capitulo, notice: "Temporada capitulo was successfully updated." }
        format.json { render :show, status: :ok, location: @temporada_capitulo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temporada_capitulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temporada_capitulos/1 or /temporada_capitulos/1.json
  def destroy
    @temporada_capitulo.destroy
    respond_to do |format|
      format.html { redirect_to temporada_capitulos_url, notice: "Temporada capitulo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temporada_capitulo
      @temporada_capitulo = TemporadaCapitulo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temporada_capitulo_params
      params.require(:temporada_capitulo).permit(:num_temporada, :num_capitulo, :activo, :activo_desde, :activo_hasta)
    end
end
