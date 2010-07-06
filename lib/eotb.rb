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
    event = @@api_key.merge(actor.to_actor).merge(action.to_action).merge(subject.to_subject)
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
  def to_actor
    actor = { "event[actor]" => actor }
  end
  
  def to_action
    action = { "event[action]" => action }
  end
  
  def to_subject
    subject_to_post = {}
    subject.each { |key, value| subject_to_post["event[subject][#{key.to_s}]"] = value.to_s }
  end
  
end