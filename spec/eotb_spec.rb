require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    Eotb.new()
    Eotb.configure('0', '127.0.0.1', '3000')
    @data = ['actor', 'action', 'username']
  end
  
  it "should post data to unknown server" do
    Eotb.register_event(@data[0], @data[1], @data[2]).code.should eql('500')
  end
  
end