class Subject
  
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

  # TODO def to_hash
  #   @subject = JSON.parse(@subject)  
  # end
  
  def to_json
    @subject = JSON.generate(@subject)    
  end
  
end