class Subject
  def initialize(args)
    @data = {}
    args.each { |key, value| @data["event[subject][#{key.to_s}]"] = format(args) }
  end
  
  def get
    @data
  end
  
  def format(object)
    if object.respond_to? :to_json
      object.to_json
    elsif object.respond_to? :to_hash
      object.to_hash.to_json
    else
      object.inspect
    end
  end
  
end