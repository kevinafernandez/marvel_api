class MarvelParameters
 #modelo usado para definir todos los parámetros
 #que permitirán consumir la API de Marvel

  def self.public_key  #clave pública
    @public_key = '34a2ea756ff442661cb5ac56eb699323'
  end

  def self.private_key #clave privada
    @private_key = 'b0f4355180f31e901c123c14bbb8389c05fdee75'
  end

  def self.timestamp #timestamp
    @ts = 1
  end

  def self.digest #codificador MD5
    Digest::MD5.hexdigest( "1#{private_key}#{public_key}" )
  end

  def self.credentials #credenciales para autenticación
    "ts=1&apikey=#{MarvelParameters.public_key}&hash=#{MarvelParameters.digest}"
  end
  
end
