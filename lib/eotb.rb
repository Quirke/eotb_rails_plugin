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
    actor = { "event[actor]" => format(actor) }
    action = { "event[action]" => action.to_s }
    data = {}
    subject.each { |key, value| data["event[subject][#{key.to_s}]"] = format(value) }
    
    event = @@api_key.merge(actor).merge(action).merge(data)
    
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
  def self.format(object)
    if object.respond_to? :to_json
      object.to_json
    elsif object.respond_to? :to_hash
        object.to_hash.to_json
    else
      object.inspect
    end
  end
  
end