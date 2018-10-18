class Marvel
  include HTTParty
  base_uri 'gateway.marvel.com:80'

  def self.character(id) #obtiene caracter por id
    response = self.get("/v1/public/characters/#{id}?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results'][0]
  end

  def self.foto(id) #consulta foto del character
    results = Marvel.character(id) 
    results['thumbnail']['path']
  end

  def self.description(id) #consulta descripcion del character
    results = Marvel.character(id) 
    results['description']
  end

  def self.all_characters #obtiene todos los caracteres     
    response = self.get("/v1/public/characters?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results']
  end

  def self.all_comics(id) #obtiene todos los comics por caracter
    #get /v1/public/characters/{characterId}/comics
    response = self.get("/v1/public/characters/#{id}/comics?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results']
  end

  def self.all_series(id) #obtiene todas los series por caracter
    #get /v1/public/characters/{characterId}/series
    response = self.get("/v1/public/characters/#{id}/series?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results']
  end

  def self.all_events(id) #obtiene todos los eventos por caracter
    #get /v1/public/characters/{characterId}/events
    response = self.get("/v1/public/characters/#{id}/events?#{MarvelParameters.credentials}")
    response_body = JSON.parse(response.body)
    puts "RESPONSE BODY: #{response_body}"
    results = response_body['data']['results']
  end

end
