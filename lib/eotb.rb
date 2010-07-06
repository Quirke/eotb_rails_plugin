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
    event = @@api_key.merge(to_actor(actor)).merge(to_action(action)).merge(to_subject(subject))
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
  def self.to_actor(actor)
    { "event[actor]" => format(actor) }
  end
  
  def self.to_action(action)
    { "event[action]" => action.to_s }
  end
  
  def self.to_subject(subject)
    subject = JSON.parse subject if subject.is_a? String
    subject_to_post = {} 
    subject.each { |key, value| subject_to_post["event[subject][#{key.to_s}]"] = format(value) }
    subject_to_post
  end
  
  def self.format(object)
    object_class = object.class
    if [String, Symbol].member? object_class
      object.to_s
    elsif [Array, Hash].member? object_class
      object.inspect
    else
      object_class
    end
  end
  
end