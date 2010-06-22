require 'json'
require 'net/http'

class Eotb
  
  def initialize(api_key, host = '127.0.0.1:3000')
    @api_key = api_key
    @host = host
    @array = []
  end
  
  def to_json(array = @array)
    JSON.generate(array)
  end
  
  def register_event(actor, action, subject)
    @array << actor << action << subject
    @array.to_json
    # @array.clear
  end
  
end