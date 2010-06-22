require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Eotb do
  
  context "register_event method" do
    
    it "should return json" do
      subject = { :user_id => 10, :user_name => "Noname" }
      Eotb.new.register_event(:current_user, :bought_membership, subject).should eql JSON.generate([:current_user, :bought_membership, subject])
    end
    
  end
  
  context "connection with app" do
    
    it "should set connection"
    
    it "should send json by POST to app"
    
  end
  
end