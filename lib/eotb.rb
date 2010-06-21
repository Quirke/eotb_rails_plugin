require 'json'

class Eotb
  
  def initialize
    @array = []
  end
  
  def to_json
    JSON.generate(@array)
  end
  
  def register_event(actor = :user, action = :no_action, subject = {})
    @array << actor << action << subject
  end
  
end