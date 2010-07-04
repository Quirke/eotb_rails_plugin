class Object
  
  def to_subject
    EotbSubject.new(self).subject
  end
  
  def to_actor
    EotbActor.new(self).actor
  end
  
end