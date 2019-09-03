class PeleasController < ApplicationController
  before_action :set_pelea, only: [:show, :edit, :update, :destroy]

  # GET /peleas
  # GET /peleas.json
  def index
    @peleas = Pelea.all
    @peleas = @peleas.page params[:page]
    @personas = Persona.all.where(esta_vivo: true)
  end

  def pelear_manualmente
    @persona = Persona.where(esta_vivo: true).order("RANDOM()").first
    @persona&.pelear
      respond_to do |format|
        format.html {  flash[:success] = "¡Pelea simulada! ver ultimo."
                        redirect_to action: "index"
        }
        format.json { render :show, status: :created, location: @rankings }
      else
        format.html { render :index }
        format.json { render json: @rankings.errors, status: :unprocessable_entity }
      end
 
  end
  # GET /peleas/1
  # GET /peleas/1.json
  def show
  end

  # GET /peleas/new
  def new
    @pelea = Pelea.new
  end

  # GET /peleas/1/edit
  def edit
  end

  # POST /peleas
  # POST /peleas.json
  def create
    @pelea = Pelea.new(pelea_params)

    respond_to do |format|
      if @pelea.save
        format.html { redirect_to @pelea, notice: 'Pelea was successfully created.' }
        format.json { render :show, status: :created, location: @pelea }
      else
        format.html { render :new }
        format.json { render json: @pelea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peleas/1
  # PATCH/PUT /peleas/1.json
  def update
    respond_to do |format|
      if @pelea.update(pelea_params)
        format.html { redirect_to @pelea, notice: 'Pelea was successfully updated.' }
        format.json { render :show, status: :ok, location: @pelea }
      else
        format.html { render :edit }
        format.json { render json: @pelea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peleas/1
  # DELETE /peleas/1.json
  def destroy
    @pelea.destroy
    respond_to do |format|
      format.html { redirect_to peleas_url, notice: 'Pelea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pelea
      @pelea = Pelea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pelea_params
      params.require(:pelea).permit(:persona_id, :character_id, :hora_pelea, :ganador)
    end
end
