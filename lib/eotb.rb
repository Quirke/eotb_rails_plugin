require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

require File.expand_path(File.dirname(__FILE__) + '/object')
require File.expand_path(File.dirname(__FILE__) + '/actor')
require File.expand_path(File.dirname(__FILE__) + '/subject')

class Eotb
    
  def self.configure(api_key, host = '127.0.0.1', port = '3000')
    @@uri = URI.parse('http://' + host + ':' + port + '/apps/' + api_key + '/events')
    @@http = Net::HTTP::Post.new(@@uri.path)
    @@api_key = api_key
  end
  
  def self.register_event(actor, action, subject)
    api_key = { "event[app_id]" => @@api_key }
    action = { "event[action]" => action }
    # TODO what if user don't send hash? 
    to_post = api_key.merge(actor).merge(action).merge(subject)
    @@http.set_form_data(to_post)
    
    Net::HTTP.new(@@uri.host, @@uri.port).start { |http| http.request(@@http) }
  end
  
end