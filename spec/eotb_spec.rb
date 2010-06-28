require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    Eotb.new('0')
    Eotb.configure('127.0.0.1', '3000')
    @data = [:actor, :action, {:username => 'Vuvuzela'}]
  end
  
  it "should check connection status" do
    Eotb.http.get('/').code.should eql('200')
  end
  
  it "should post data in json" do
    Eotb.register_event(@data[0], @data[1], @data[2]).code.should eql('200')
  end
  
end