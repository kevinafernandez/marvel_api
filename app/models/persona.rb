class Persona < ApplicationRecord
  include Filterable #helper para filtrar de acuerdo a parametros definidos

  has_many :peleas

  scope :search, -> (search) { where('lower(nombre) LIKE ?', "%#{search.to_s.downcase}%")} #busqueda por nombre
  scope :by_esta_vivo, lambda { |esta_vivo| where('esta_vivo = ?', esta_vivo) }
  validates :nombre, presence:true, :uniqueness => {:case_sensitive => false} #validacion

  def pelear

	persona = self
	superheroe = Character.where(ha_peleado: false).order("RANDOM()").first #obtiene superheroe aleatoriamente
	ganador_persona = nil
	hora_pelea = DateTime.now
	 if persona.esta_vivo
	  if persona.poder_ataque > superheroe.poder_ataque
	     persona.puntos_acumulados += 1 #hasta persona perder
	     if persona.poder_ataque >= 10 #si la persona gana, se le va disminuyendo poder_ataque para que no gane eternamente
	      persona.poder_ataque -= 10
	     else
	      persona.poder_ataque = 0
	     end
	   ganador_persona = true
	   persona.peleas_ganadas_dia += 1 #peleas ganadas por dia
	   persona.save!
	   persona.pelear #pelea nuevamente, hasta que poder_ataque llegue a 0 (recursividad)
	  else #persona derrotada
	     persona.update_column(:esta_vivo, false)
	     ganador_persona = false
	  end
	 end
	Pelea.create!(persona_id: persona.id, character_id: superheroe.id, 
				  hora_pelea: hora_pelea, ganador_persona: ganador_persona) #guarda peleas para su historial
  end

  def revivir
  	self.update_column(:esta_vivo, true)
  end

  	
  
end
