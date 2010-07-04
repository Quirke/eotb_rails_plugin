require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    Eotb.configure("4c3089feb3dfae0304000004")
  end
  
  it "should register strings"
  
  it "should register symbols"
  
  it "should register objects with to_actor and to_subject"
  
  it "should not register object without to_actor and to_subject"
  
  it "should register hashes"
  
  it "should register arrays"
  
  it "should generate JSON from event"
  
  it "should parse JSON to event (by to_hash method)"
  
  it "should inspect event (by inspect method)"
  
end