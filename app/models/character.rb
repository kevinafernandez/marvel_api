class Character
  attr_accessor :character_id, :name, :thumbnail, :description

  def initialize(args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.find_all
    characters = []
    limit = 35
    results = Marvel.all_characters #invoca el metodo para obtener todos los caracteres
    results.each do |result|
      characters << Character.new(character_id: result['id'],
                     name: result['name'],
                     thumbnail: result['thumbnail']['path'],
                     description: result['description'],
                     limit: limit)
    end
    characters 
  end

  def self.find(id)
    results = Marvel.character(id) #invoca el metodo para obtener un caracter por id
    puts "RESPONSE DATA RESULTS: #{results}"
    Character.new(
      character_id: results['id'],
      name: results['name'],
      thumbnail: results['thumbnail']['path'],
      description: results['description']
    )
  end

end
