class EotbSubject
  
  attr_reader :subject
  
  def initialize(object)
    @subject = {}
    @subject.merge(object).each { |key, value| subject[key] = value.class.to_s }
  end
  
end