require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before :each do
    @eotb = Eotb.new
  end
  
  it "should have register_event method" do
    @eotb.methods.should include("register_event")
  end

end