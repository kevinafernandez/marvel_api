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

 desc "Peleas" #se ejecuta en schedule.rb
 task peleas: :environment do
 	persona = Persona.where(esta_vivo: true).order("RANDOM()").first
 	persona.pelear
 end 

 desc "Revivir todos las personas" #se ejecuta en schedule.rb
  task revivir_todos: :environment do
  	personas = Persona.where(esta_vivo: false)
  	personas.each do |persona|
  	  persona.poder_ataque = Random.rand(100)
  	  persona.esta_vivo = true
  	  persona.save!
  	end 
  end 

  desc "Reset ranking" #se ejecuta en schedule.rb
  task reset_ranking: :environment do
  	Persona.all.update_all(peleas_ganadas_dia: 0)
  end 

end