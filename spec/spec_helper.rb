$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'eotb'
require 'spec'
require 'spec/autorun'
require 'json'

Spec::Runner.configure do |config|
  
end