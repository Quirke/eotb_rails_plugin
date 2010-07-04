class EotbObject
  
  attr_reader :subject
  
  # FIXME subject is not a hash
  
  def initialize(object)
    @subject = {}
    object.each do |key, value|
       @subject["event[subject][#{key.to_s}]"] = value.to_s
    end
    @subject
  end
  
  def inspect
    @subject.inspect
  end
  
  def to_json
    @subject = JSON.generate(@subject)    
  end
  
end