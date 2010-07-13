require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:all) do
    @response = "200"
    Eotb.configure("0"*24)
  end
  
  it "should format actor in string" do
    Eotb.format_hash("actor", :actor).should == {"event[actor]" => "\"actor\""}
  end
  
  it "should format actor in hash" do
    Eotb.format_hash({:type => "User"}, :actor).should == {"event[actor][type]" => "\"User\""}
  end
  
  it "should format actor in nested hash" do
    Eotb.format_hash({:type => { :account => "User"}}, :actor).should == {"event[actor][type][account]" => "\"User\""}
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
    Eotb.register_event({:type => "User"}, :action, {:username => {:first_name => "John"}}).code.should == @response
  end
  
  it "should register nested hashes" do
    Eotb.register_event({:type => { :account => "User"}}, :action, {:username => {:first_name => "John"}}).code.should == @response
  end
  
  it "should register arrays" do
    Eotb.register_event([2,3,4], :action, {:username => ["John", "Josh"]}).code.should == @response
  end
  
end