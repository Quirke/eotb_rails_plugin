require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before :each do
    @eotb = Eotb.new
  end
  
  it "should have register_event method" do
     @eotb.methods.should include(:register_event)
   end
  
  describe ".register_event" do
    
    before :each do
      @register_event = @eotb.register_event
    end
    
    it "should be an array" do
      @register_event.should be_a(Array)
    end
    
    it "should have three items" do
      @register_event.should have(3).items
    end
    
    it "last argument should be a hash" do
      @register_event[2].should be_a(Hash)
    end
    
  end
  
end