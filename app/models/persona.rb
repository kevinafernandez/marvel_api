class Persona < ApplicationRecord
  include Filterable #helper para filtrar de acuerdo a parametros definidos

  scope :search, -> (search) { where('lower(nombre) LIKE ?', "%#{search.to_s.downcase}%")} #busqueda por nombre
  validates :nombre, presence:true, :uniqueness => {:case_sensitive => false} #validacion

end
