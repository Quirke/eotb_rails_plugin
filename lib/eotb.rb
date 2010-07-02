require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

require File.expand_path(File.dirname(__FILE__) + '/actor')
require File.expand_path(File.dirname(__FILE__) + '/subject')

class Object
  
  def to_actor(actor)
    Actor.new(actor)
  end
  
  def to_subject(subject)
    Subject.new(subject)
  end
  
end

class Eotb
    
  def self.configure(api_key, host = '127.0.0.1', port = '3000')
    @@uri = URI.parse('http://' + host + ':' + port + '/apps/' + api_key + '/events')
    @@http = Net::HTTP::Post.new(@@uri.path)
    @@api_key = api_key
  end
  
  def self.register_event(actor, action, subject)
    to_post = {"event[app_id]" => @@api_key, "event[actor][type]" => actor, "event[action]" => action }
    subject.each do |key, value|
      to_post["event[subject][#{key.to_s}]"] = value.to_s
    end
    @@http.set_form_data(to_post)
    Net::HTTP.new(@@uri.host, @@uri.port).start { |http| http.request(@@http) }
  end
  
  def to_json(array)
    JSON.generate(array)
  end
  
end