class EotbActor
  
  attr_reader :actor
  
  def initialize(object)
    @actor = object.inspect
  end
  
  def inspect
    @actor.inspect
  end
  
end