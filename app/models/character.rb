class Character < ApplicationRecord

  def get_image #obtiene imagen por caracter desde la API
    @image = Marvel.foto(self.id)
  end

  def get_description #obtiene la descripcion por caracter desde la API
    @descripcion = Marvel.description(self.id)
  end

  def get_comics #obtiene todos los comics por caracter
    @comics = Marvel.all_comics(self.id)
  end

  def get_series #obtiene todos los series por caracter
    @series = Marvel.all_series(self.id)
  end

  def get_events #obtiene todos los events por caracter
    @events = Marvel.all_events(self.id)
  end



end
