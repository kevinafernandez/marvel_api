class Marvel
  include HTTParty
  base_uri 'gateway.marvel.com:80'

  def self.character(id) #obtiene caracter por id
    response = self.get("/v1/public/characters/#{id}?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results'][0]

  end

  def self.all_characters #obtiene todos los caracteres     
    response = self.get("/v1/public/characters?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results']
  end

  def self.comic(id) #obtiene comic por id
    response = self.get("/v1/public/comics/#{id}?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results'][0]
  end

  def all_comics #obtiene todos los comics de los caracteres
    #get /v1/public/characters/{characterId}/comics
    response = self.get("/v1/public/characters/#{id}?/comics?#{MarvelParameters.credentials}")

    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results']
  end

  def self.serie(id) #obtiene serie por id
    response = self.get("/v1/public/series/#{id}?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results'][0]
  end

  def self.all_series #obtiene todas las series de los caracteres
    response = self.get("/v1/public/series?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results']
  end

  def self.event(id) #obtiene evento por id
    response = self.get("/v1/public/events/#{id}?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results'][0]
  end

  def self.all_events #obtiene todos los eventos de los caracteres
    response = self.get("/v1/public/events?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results']
  end

end
