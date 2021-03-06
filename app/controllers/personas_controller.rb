class PersonasController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  include Tracer
  
  after_action do |controller|
    trace(controller.request, controller.response)
  end
  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.all
    render json: @personas
  end

  # GET /personas/1
  # GET /personas/1.json
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

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona correctamente creada.' }
        format.json { render json: @persona, status: :created }
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
        format.html { redirect_to @persona, notice: 'Persona actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy unless Persona::STATIC_PERSON_NAMES.include?(@persona.nombres)
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona eliminada correctamente.' }
      format.json { render json: {respuesta: 'Persona eliminada correctamente.'} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombres, :apellidos, :email, telefonos_attributes: [:numero, :persona_id])
    end
end
