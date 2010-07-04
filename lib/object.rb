class Object
  
  def to_subject
    EotbObject.new(self).subject
  end
  
  alias :to_actor :to_subject
  
end