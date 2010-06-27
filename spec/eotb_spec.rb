require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    @eotb = Eotb.new('0')
    @data = [:actor, :action, {:username => 'Vuvuzela'}]
  end
  
  it "should check connection status" do
    @eotb.http.get('/').code.should eql('200')
  end
  
  it "should have data in json" do
    @eotb.to_json(@data).should eql(JSON.generate(@data))
  end
  
  it "should post data in json" do
    @eotb.register_event(@data[0], @data[1], @data[2]).code.should eql('200')
  end
  
end