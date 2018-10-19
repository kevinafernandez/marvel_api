class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy, :revivir]

  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.all
    @by_esta_vivo = params[:by_esta_vivo]
    @personas = @personas.filter(params.slice(:search, :by_esta_vivo)) #parametros para buscar por nombre
    @personas = @personas.page params[:page] #paginacion
  end

  def revivir #revive a la persona manualmente
    @persona = Persona.find(params[:id])
    @poder_ataque = Random.rand(100)
    respond_to do |format|
     if @persona.esta_vivo == false
      if @persona.update(esta_vivo: true, poder_ataque: @poder_ataque)
        format.html {  flash[:notice] = "¡La persona #{@persona.nombre} ha sido revivida y con un nuevo poder de ataque, ahora podrá pelear!"
                        redirect_to action: "show"
        }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :show }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
     end
    end
  end

  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    @random = Random.rand(100) #valor random para el poder de ataque
    respond_to do |format|
      if @persona.save
        @persona.update(poder_ataque: @random)
        format.html {  flash[:success] = "La persona #{@persona.nombre} fue creado exitósamente"
                        redirect_to persona_path(@persona)
        }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html {  flash[:success] = "La persona #{@persona.nombre} fue editada exitósamente"
                        redirect_to persona_path(@persona)
         }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombre, :poder_ataque)
    end
end
