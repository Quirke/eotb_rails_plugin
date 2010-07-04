class EotbActor
  
  attr_reader :actor
  
  def initialize(object)
    @actor = object.class.to_s
  end
  
end