require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    @response = "200"
    Eotb.configure("4c333965b3dfae07bd00000d")
  end
  
  it "should register two arguments" do
    Eotb.register_event("actor", "action").code.should == @response
  end
  
  it "should register three arguments" do
    Eotb.register_event("actor", "action", {:username => "John"}).code.should == @response
  end
  
  it "should register symbols" do
    Eotb.register_event(:actor, :action, {:username => "John"}).code.should == @response
  end
  
  it "should register objects" do
     Eotb.register_event(Object.new, :action, {:username => Object.new}).code.should == @response
  end

  it "should register hashes" do
     Eotb.register_event({:type => "User"}, :action, {:username => "John"}).code.should == @response
  end
  
  it "should register arrays" do
     Eotb.register_event([2,3,4], :action, {:username => ["John", "Josh"]}).code.should == @response
  end
  
  it "should register subject in json" do
     Eotb.register_event([2,3,4], :action, "{\"username\":\"John\"}").code.should == @response
  end
  
end