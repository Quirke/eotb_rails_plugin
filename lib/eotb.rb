require 'net/http'
require 'rubygems'
require 'json'

class Eotb
  
  attr_accessor :api_key, :host, :port
  
  def initialize(api_key, host = '127.0.0.1', port = '3000')
    @api_key = api_key
    @host = host
    @port = port
  end
  
  def set_connection
    http = Net::HTTP.new(host, port)
    path = '/apps/' + api_key.to_s + '/events'
  end
  
  def to_json(array)
    JSON.generate(array)
  end
  
  def register_event(actor, action, subject)
    [actor, action, subject].to_json
  end
  
end