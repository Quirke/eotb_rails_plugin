require './eotb'

describe Eotb do
  
  before(:each) do
    @eotb = Eotb.new
  end
  
  it do
    @eotb.register_event.should be_a(Array)
  end

end


