require './eotb'

describe Eotb do
  
  before(:each) do
    @eotb = Eotb.new
    @eotb_reg = @eotb.register_event(:actor, :action, :subject)
  end
  
  it do
    @eotb_reg.should be_a(Array)
  end
  
  it do
    @eotb_reg.should have(3).items
  end

end


