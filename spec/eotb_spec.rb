require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    @response = "302"
    Eotb.configure("4c3128cfb3dfae0b180000e8")
  end
  
  it "should register only two arguments" do
    Eotb.register_event("actor_string", "action_string").code.should == @response
  end
  
  it "should register default arguments (strings)" do
    Eotb.register_event("actor_string", "action_string", {:username => "John"}).code.should == @response
  end
  
  it "should register default arguments (symbols)" do
    Eotb.register_event(:actor_symbol, :action_symbol, {:username => "John"}).code.should == @response
  end
  
  it "should register objects with to_actor and to_subject" do
     Eotb.register_event(Object.new.to_actor, :action_symbol, {:username => Object.new}.to_subject).code.should == @response
  end
  
  it "should generate JSON from subject" do
    {:username => "John"}.to_subject.to_json.should == JSON.generate({:username => "John"})
  end
  
  # it "should parse JSON from subject" do
  #   {:username => "John"}.to_subject.to_json.to_hash.should == JSON.generate({:username => "String"})
  # end
  
end