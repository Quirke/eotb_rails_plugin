require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

class Eotb
    
  def self.configure(api_key, host = '127.0.0.1', port = '3000')
    @@uri = URI.parse('http://' + host + ':' + port + '/apps/' + api_key + '/events')
    @@post = Net::HTTP::Post.new(@@uri.path)
    @@api_key = { "event[app_id]" => api_key }
  end
  
  def self.register_event(actor, action, subject = {})
    action = { "event[action]" => action.to_s }    
    event = @@api_key.merge(format_hash(actor, :actor)).merge(action).merge(format_hash(subject, :subject))
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
  # TODO
  def self.format_hash(hash, type)
    
    def self.rec(value, key, path)
      key = "[#{key.to_s}]"
      path += key
      if hash.respond_to? :each_pair
        hash.each { |key, value| rec(value, key, path) }
      else
        { "#{path}" => format(value) }
      end
    end
    
    data = {}
    data.merge(rec(hash, type, "event"))
  end
  
  def self.format(object)
    if object.respond_to? :to_actor
      object.to_actor
    elsif object.respond_to? :to_subject
      object.to_subject
    elsif object.respond_to? :to_json
      object.to_json
    elsif object.respond_to? :to_hash
      object.to_hash
    else
      object.inspect
    end
  end
  
end