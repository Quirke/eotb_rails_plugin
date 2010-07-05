class EotbSubject
  
  attr_reader :subject
  
  def initialize(object)
    @subject = {}
    @subject.merge(object).each { |key, value| subject[key] = value.to_s }
  end
  
  def to_json
    @subject = JSON.generate(@subject)
  end
  
  # def to_hash
  #   @subject = JSON.parse(@subject)
  # end
  
  def inspect
    @subject.inspect
  end
  
end