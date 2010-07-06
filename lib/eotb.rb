require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

class Eotb
    
  def self.configure(api_key, host = '127.0.0.1', port = '3000')
    @@uri = URI.parse('http://' + host + ':' + port + '/apps/' + api_key + '/events')
    @@post = Net::HTTP::Post.new(@@uri.path)
    @@api_key = api_key
  end
  
  def self.register_event(actor, action, subject = {})
    api_key = { "event[app_id]" => @@api_key }
    action = { "event[action]" => action }
    actor = { "event[actor]" => actor }
    subject_to_post = {}
    subject.each { |key, value| subject_to_post["event[subject][#{key.to_s}]"] = value.to_s }
    
    event = api_key.merge(actor).merge(action).merge(subject_to_post)
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
end