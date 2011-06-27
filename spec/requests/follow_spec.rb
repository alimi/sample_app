require 'spec_helper'

describe "Follow" do
  before(:each) do
    user = Factory(:user)
    @otheruser = Factory(:user, :email => Factory.next(:email))
    integration_sign_in(user)
  end

  describe "Following" do
    it "should follow a user" do
      #click_link "Users"
      #click_link user_path(@otheruser)
      visit user_path(@otheruser)
      click_button "Follow"
      response.should have_selector("a", :href => following_user_path(@otheruser), 
                                         :content => "0 following")
      response.should have_selector("a", :href => followers_user_path(@otheruser),
                                         :content => "1 follower")
    end
  end

  describe "Unfollow" do
    it "should unfollow a user" do
      #click_link "Users"
      #click_link user_path(@otheruser)
      visit user_path(@otheruser)
      click_button "Follow"
      click_button "Unfollow"
      response.should have_selector("a", :href => following_user_path(@otheruser), 
                                         :content => "0 following")
      response.should have_selector("a", :href => followers_user_path(@otheruser),
                                         :content => "0 follower")
    end
  end

end
