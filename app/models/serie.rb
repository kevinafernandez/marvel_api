class Serie
  attr_accessor :title, :description, :thumbnail, :url

  def initialize(args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.find_all
    results = Marvel.all_series #invoca el metodo para obtener todas las series
    puts results
    series = []
    results.each do |result|
      if result['images'].length > 0
        series << Serie.new(
          title: result['title'],
          description: result['description'],
          thumbnail: result['images'][0]['path'],
          url: result['urls'][0]['url']
        )
      else
        series << Serie.new(
        title: result['title'],
        description: result['description'],
        thumbnail: result['thumbnail']['path'],
        url: result['urls'][0]['url']
        )
      end
    end
    series
  end

  def self.find(id)
    results = Marvel.serie(id) #invoca el metodo para obtener serie por id
    Serie.new(
      title: results['title'],
      description: results['description'],
      thumbnail: results['thumbnail']['path'],
      url: results['urls'][0]['url']
    )
  end
end
