require 'json'
require 'net/http'

class Eotb
  
  def initialize
    @array = []
  end
  
  def to_json
    JSON.generate(@array)
  end
  
  def register_event(actor, action, subject)
    @array << actor << action << subject
  end
  
end