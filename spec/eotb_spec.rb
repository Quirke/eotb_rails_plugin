require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  context "register_event method" do
    
    before(:each) do
      @eotb = Eotb.new.register_event(:current_user, :bought_membership, { :user_id => 10, :user_name => "Noname" })
    end
    
    it "should get three arguments (actor, action, subject)"
    
    it "subject should be a hash or a symbol"
    
    it "should return json" 
    
  end
  
  context "connection with app" do
    
    it "should set connection"
    
    it "should send json by POST to app"
    
  end
  
end