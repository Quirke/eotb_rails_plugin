class Eotb
  
  def initialize
    @array = []
  end
  
  def register_event(actor, action, subject)
    @array << actor << action << subject
  end
  
end