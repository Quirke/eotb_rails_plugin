require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  it "should check connection status" do
    eotb = Eotb.new('0')
    response = Net::HTTP.new(eotb.host, eotb.port).get('/')
    response.code.should eql('200')
  end
  
  it "should return data in json" do
    actor = :actor
    action = :action
    data = {:username => 'Vuvuzela'}
    Eotb.new('0').register_event(actor, action, data).should eql(JSON.generate([actor, action, data]))
  end
  
end