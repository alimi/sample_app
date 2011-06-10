require 'spec_helper'

describe PagesController do
 render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
       get 'home'
       response.should have_selector("title", :content => @base_title + " | Home")
    end

    describe "for signed-in users" do
      before(:each) do 
        @user = test_sign_in(Factory(:user))
      end

      it "should show the user's microposts" do
        get 'home'
        response.should have_selector("span", :class => "microposts", :content => "micropost")
      end

      it "should show 0 microposts" do
        get 'home'
        response.should have_selector("span", :class => "microposts", :content => "microposts")
      end

      it "should show 1 micropost" do
        @mp1 = Factory(:micropost, :user => @user)
        get 'home'
        response.should_not have_selector("span", :class => "microposts", :content => "microposts")
      end
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
       get 'contact'
       response.should have_selector("title", :content => @base_title + " | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
       get 'about'
       response.should be_success
     end

    it "should have the right title" do
       get 'about'
       response.should have_selector("title", :content => @base_title + " | About")
    end
  end

 describe "GET 'help'" do
    it "should be successful" do
       get 'help'
       response.should be_success
    end
    it "should have the right title" do
       get 'help'
       response.should have_selector("title", :content => " | Help")
    end
  end

end
