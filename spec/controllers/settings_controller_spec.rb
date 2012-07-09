require 'spec_helper'

describe SettingsController do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  describe "GET 'lang'" do
    it "returns http success" do
      get 'lang'
      response.should be_success
    end
  end

end
