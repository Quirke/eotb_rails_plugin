require 'net/http'
require 'rubygems'
require 'json'

class Eotb
  
  def initialize(api_key)
    @@path = '/apps/' + api_key.to_s + '/events'
  end
    
  def self.configure(host = '127.0.0.1', port = '3000')
    @@http = Net::HTTP.new(host, port)
  end
  
  def to_json(array)
    JSON.generate(array)
  end
  
  def self.http
    @@http
  end
  
  def self.register_event(actor, action, subject = nil)
    @@http.post(@@path, [actor, action, subject].compact.to_json)
  end
  
end