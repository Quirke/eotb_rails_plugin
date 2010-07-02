class Subject
  
  def initialize(object)
    object.each do |key, value|
       @subject["event[subject][#{key.to_s}]"] = value.to_s
    end
    @subject
  end
  
  def inspect
    @subject.inspect
  end
  
  def to_hash
    JSON.parse(@subject)  
  end
  
  def to_json
    JSON.generate(@subject)    
  end
  
end