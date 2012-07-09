require 'spec_helper'

describe Log do
  before(:each) do
    @attr = {
      :from => "Login",
      :level => 0,
      :cat => "common",
      :msg => "msgmsg"
    }
  end
  it "should create a new instance given a valid attribute" do
    Log.create!(@attr)
  end

end
