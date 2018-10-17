class Event
  attr_accessor :event_id, :name, :thumbnail, :description

  def initialize(args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.find_all
    events = []
    results = Marvel.all_events #invoca el metodo para obtener todos los eventos
    results.each do |result|
      events << Event.new(event_id: result['id'],
                     name: result['name'],
                     thumbnail: result['thumbnail']['path'],
                     description: result['description'])
    end
  end

  def self.find(id)
    results = Marvel.event(id) #invoca el metodo para obtener un evento por id
    puts "RESPONSE DATA RESULTS: #{results}"
    Event.new(
      event_id: results['id'],
      name: results['name'],
      thumbnail: results['thumbnail']['path'],
      description: results['description']
    )
  end
end
