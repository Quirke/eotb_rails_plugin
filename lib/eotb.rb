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
    event = @@api_key.merge(format_hash(actor, :actor)).merge(action).merge(format_hash(subject, :subject))
    @@post.set_form_data(event)
    Net::HTTP.new(@@uri.host, @@uri.port).start.request(@@post)
  end
  
  def self.hash_flatten h
    h.inject({}) do |a,(k,v)|
      if v.is_a?(Hash)
        hash_flatten(v).each do |sk, sv|
          a[[k]+sk] = sv
        end
      else
        k = k ? [k] : []
        a[k] = v
      end
      a
    end
  end

  def self.format_hash h
    if h.is_a?(Hash)
      a = hash_flatten(h).map do |k,v|
        key = k.map { |e| "[#{e}]" }.join "\"event[actor]#{key}\" => \"#{v}\""
      end.join(', ')
      eval '{' + a + '}'
    else
      format_hash({nil => h})
    end
  end
  
  def self.format(object)
    if object.respond_to? :to_actor
      object.to_actor
    elsif object.respond_to? :to_subject
      object.to_subject
    elsif object.respond_to? :to_json
      object.to_json
    elsif object.respond_to? :to_hash
      object.to_hash
    else
      object.inspect
    end
  end
  
end