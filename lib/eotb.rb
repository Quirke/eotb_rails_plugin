require 'net/http'
require 'rubygems'
require 'json'

class Eotb
  
  attr_reader :http
  
  def initialize(api_key, host = '127.0.0.1', port = '3000')
    @path = '/apps/' + api_key.to_s + '/events'
    @http = Net::HTTP.new(host, port)
  end
  
  def to_json(array)
    JSON.generate(array)
  end
  
  def register_event(actor, action, subject = nil)
    @http.post(@path, [actor, action, subject].compact.to_json)
  end
  
end