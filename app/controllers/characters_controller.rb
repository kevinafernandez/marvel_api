class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
   @character = Character.find(params[:id])
   @image = @character.get_image
   @description_character = @character.get_description
   @series = @character.get_series 
   @comics = @character.get_comics
   @events = @character.get_events 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:poder_ataque)
    end
end
