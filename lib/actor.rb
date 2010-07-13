class Actor
  def initialize(args)
    @a = { "event[actor]" => format(args) }
  end
  
  def get
    @a
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