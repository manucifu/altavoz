class CancionesController < ApplicationController
  before_action :set_cancione, only: %i[ show edit update destroy ]

  # GET /canciones or /canciones.json
  def index
    @canciones = Cancione.all
  end

  # GET /canciones/1 or /canciones/1.json
  def show
  end

  # GET /canciones/new
  def new
    @cancione = Cancione.new
  end

  # GET /canciones/1/edit
  def edit
  end

  # POST /canciones or /canciones.json
  def create
    @cancione = Cancione.new(cancione_params)

    respond_to do |format|
      if @cancione.save
        format.html { redirect_to @cancione, notice: "Cancione was successfully created." }
        format.json { render :show, status: :created, location: @cancione }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cancione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canciones/1 or /canciones/1.json
  def update
    respond_to do |format|
      if @cancione.update(cancione_params)
        format.html { redirect_to @cancione, notice: "Cancione was successfully updated." }
        format.json { render :show, status: :ok, location: @cancione }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cancione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canciones/1 or /canciones/1.json
  def destroy
    @cancione.destroy
    respond_to do |format|
      format.html { redirect_to canciones_url, notice: "Cancione was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cancione
      @cancione = Cancione.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cancione_params
      params.require(:cancione).permit(:url_youtube, :url_spotify, :nombre, :activo, :temporada_capitulo_id, :descripcion)
    end
end
