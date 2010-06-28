require 'net/http'
require 'uri'
require 'rubygems'
require 'json'

class Eotb
    
  def self.configure(api_key, host = '127.0.0.1', port = '3000')
    @@uri = URI.parse('http://' + host + ':' + port + '/apps/' + api_key + '/events')
    @@http = Net::HTTP::Post.new(@@uri.path)
    @@api_key = api_key
  end
  
  def to_json(array)
    JSON.generate(array)
  end
  
  def self.register_event(actor, action, subject)
    @@http.set_form_data({"event[actor][name]" => actor, "event[action]" => action, "event[subject][name]" => subject, "event[app_id]" => @@api_key}, ';')
    Net::HTTP.new(@@uri.host, @@uri.port).start { |http| http.request(@@http) }
  end
  
end