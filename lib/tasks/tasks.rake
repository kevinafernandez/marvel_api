namespace :nnodes do

desc "Guarda los caracteres en la base de datos para efectos de la simulacion de la pelea"
   task guardar_character_db: :environment do
	Marvel.all_characters.each do |heroe|
		@id = heroe["id"]
		@name = heroe["name"]
		@poder_ataque = Random.rand(100) 
		if !Character.find_by(id: @id).present?
			@character = Character.create(id: @id, name: @name, poder_ataque: @poder_ataque) 
	end
  end
 end 
end