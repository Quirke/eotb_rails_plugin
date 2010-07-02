class Actor
  
  attr_reader :actor
  
  def initialize(object)
    @actor = { "event[actor][type]" => object.to_s }
  end
  
  def to_json
    @actor = JSON.generate(@actor)
  end
  
  # TODO
  # def to_hash
  #   @actor = JSON.parse(@actor)
  # end
  
  def inspect
    @actor.inspect
  end
  
end