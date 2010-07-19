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
    action = { "event[action]" => action.to_s }    
    event = @@api_key.merge(hash_format(actor, :actor)).merge(action).merge(hash_format(subject, :subject))
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
  def self.value_format(value)
    methods = [:to_actor, :to_subject, :to_json, :to_hash, :inspect]
    value.send methods.find { |m| m if value.respond_to? m }
  end
  
  def self.hash_flatten(hash)
    hash.inject({}) do |h, (k, v)|
      if v.is_a?(Hash)
        hash_flatten(v).each do |sk, sv|
          h[[k] + sk] = sv
        end
      else
        k = k ? [k] : []
        h[k] = v
      end
      h
    end
  end

  def self.hash_format(hash, type)
    if hash.is_a?(Hash)
      a = hash_flatten(hash).map do |k, v|
        key = k.map{ |e| "[#{e}]" }.join
        "\"event[#{type}]#{key}\" => #{value_format(v)}"
      end
      a.join(', ')
    else
      a = "\"event[#{type}]\" => #{value_format(hash)}"
    end
    eval('{' + a. + '}')
  end
  
end