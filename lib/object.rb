class Object
  
  def to_actor
    Actor.new(self).actor
  end
  
  def to_subject
    Subject.new(self).subject
  end
  
end