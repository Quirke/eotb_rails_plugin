require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  it "should check connection status" 
  
  it "should return data in json" do
    actor = :actor
    action = :action
    data = {:username => 'Vuvuzela'}
    Eotb.new('0').register_event(actor, action, data).should eql(JSON.generate([actor, action, data]))
  end
  
end