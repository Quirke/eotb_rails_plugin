require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:all) do
    @response = "200"
    Eotb.configure("0"*40)
  end
  
  def stubs
    Net::HTTP.stub(:new) {Net::HTTP} 
    Net::HTTP.stub(:start) {Net::HTTP} 
    Net::HTTP.stub(:request) {"200"}
  end
  
  it "should format actor in string" do
    Eotb.hash_format("actor", :actor).should == {"event[actor]" => "actor"}
  end
  
  it "should format actor in hash" do
    Eotb.hash_format({:type => "User"}, :actor).should == {"event[actor][type]" => "User"}
  end
  
  it "should format actor in nested hash" do
    Eotb.hash_format({:type => { :account => "User"}}, :actor).should == {"event[actor][type][account]" => "User"}
  end
  
  it "should register two arguments" do
    stubs
    Eotb.register_event("actor", "action").should == @response
  end
  
  it "should register three arguments" do
    stubs
    Eotb.register_event("actor", "action", {:username => "John"}).should == @response
  end
  
  it "should register symbols" do
    stubs
    Eotb.register_event(:actor, :action, {:username => "John"}).should == @response
  end
  
  it "should register objects" do
    stubs
    Eotb.register_event(Object.new, :action, {:username => Object.new}).should == @response
  end

  it "should register hashes" do
    stubs
    Eotb.register_event({:type => "User"}, :action, {:username => {:first_name => "John"}}).should == @response
  end
  
  it "should register nested hashes" do
    stubs
    Eotb.register_event({:type => { :account => "User"}}, :action, {:username => {:first_name => "John"}}).should == @response
  end
  
  it "should register arrays" do
    stubs
    Eotb.register_event([2,3,4], :action, {:username => ["John", "Josh"]}).should == @response
  end
  
  it "should log errors if connection error happens" do 
    logger = mock(Logger)
    Logger.stub(:new) { logger}
    logger.stub(:error) {true}
    Eotb.register_event(:actor, :action, {:username => "John"}).should == true
  end
  
end
