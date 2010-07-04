require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    @response = "302"
    Eotb.configure("4c3089feb3dfae0304000004")
  end
  
  it "should register strings" do
    Eotb.register_event("actor", "action", "subject").code.should == @response
  end
  
  it "should register symbols" do
    Eotb.register_event(:actor, :action, :subject).code.should == @response
  end
  
  it "should register objects with to_actor and to_subject" do
    Eotb.register_event(Object.new.to_actor, :action, Object.new.to_subject).code.should == @response
  end
  
  it "should not register object without to_actor and to_subject" do
    Eotb.register_event(Object.new, :action, Object.new).code.should_not == @response
  end
  
  it "should register hashes" do
    Eotb.register_event({:type => "user"}, :action, {:username => "John"}).code.should == @response
  end
  
  it "should register arrays" do
    Eotb.register_event([user], :action, [John, Josh]).code.should == @response
  end
  
  it "should generate JSON from subject (actor)" do
    {:username => "John"}.to_subject.to_json.should == JSON.generate({:username => "John"})
  end
  
  it "should parse JSON to subject (actor) (by to_hash method)" do
    {:username => "John"}.to_subject.to_json.to_hash.should == JSON.parse("{\"username\":\"John\"}")
  end
  
  it "should inspect subject (actor) (by inspect method)" do
    {:username => "John"}.to_subject.to_json.to_hash.inspect.should == {:username => "John"}.inspect
  end
  
end