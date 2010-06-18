require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  before(:each) do
    @eotb = Eotb.new
    subject = { :key => 'value' }
    @eotb_reg = @eotb.register_event(:actor, :action, subject)
  end
  
  it "shoud be a array" do
    @eotb_reg.should be_a(Array)
  end
  
  it do
    @eotb_reg.should have(3).items
  end
  
  it "should be a hash" do
    @eotb_reg[2].should be_a(Hash)
  end

end


