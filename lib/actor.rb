class Actor
  
  def initialize(object)
    @actor = { "event[actor][type]" => object.inspect }
  end
  
  def inspect
    @actor.inspect
  end
  
  def to_hash
    JSON.parse(@actor)
  end
  
  def to_json
    JSON.generate(@actor)
  end
  
end