# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


 #20 nombres de personas para poblar la DB
 @nombres = []
 @nombres = ['Daniel','Pablo','Marcos','Javier','David','Alejandro','Victor','Mario','Diego','Sergio',	
		    		 'Lucía','María','Daniela','Marta','Sara','Sofía','Carmen','Laura','Julia','Irene']


@nombres.each do |nombre|
	poder_ataque = Random.rand(100) #asignacion de poder de ataque de forma aleatoria.
 	persona = Persona.new(nombre: nombre, poder_ataque: poder_ataque)
	 if persona.save
	 		puts "#{persona.nombre} y su poder #{poder_ataque} fueron creados"
	 end
end
