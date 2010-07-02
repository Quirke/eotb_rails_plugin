class Object
  
  def to_actor
    Actor.new(self)
  end
  
  def to_subject
    Subject.new(self)
  end
  
end