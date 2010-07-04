class EotbObject
  
  def initialize(object)
    @subject = {}
    object.each do |key, value|
       @subject["event[subject][#{key.to_s}]"] = value.to_s
    end
    @subject
  end
  
end