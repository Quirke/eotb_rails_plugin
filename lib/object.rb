class Object
  
  def to_actor
    EotbActor.new(self).actor
  end
  
end

class Hash
  
  def to_subject
    EotbSubject.new(self).subject
  end
  
end