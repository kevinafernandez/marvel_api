class Persona < ApplicationRecord
  include Filterable

  scope :search, -> (search) { where('lower(nombre) LIKE ?', "%#{search.to_s.downcase}%")}
  validates :nombre, presence:true, :uniqueness => {:case_sensitive => false}
end
