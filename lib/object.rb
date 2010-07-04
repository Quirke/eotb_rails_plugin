class Object
  
  def to_subject
    EotbSubject.new(self)
  end
  
  def to_actor
    EotbActor.new(self)
  end
  
end