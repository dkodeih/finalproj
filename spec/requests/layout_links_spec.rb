require 'spec_helper'

describe "LayoutLinks" do
  
    it "should have a home page at '/'" do
      get '/'
      response.should have_selector("title", :content => "Home")
    end
  
     it "should have a contact page at '/contact'" do
      get '/contact'
      response.should have_selector("title", :content => "Contact")
    end
     
     it "should have a sign-up page at '/signin'" do
      get '/signin'
      response.should have_selector("title", :content => "Signin")
    end
    
    it "should have the right links on the layout" do
      visit root_path
      response.should have_selector('title', :content => "Home")
      click_link "About"
      #response.should have_selector('title', :content => "About")
      #click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      click_link "Sign In"
      response.should have_selector('title', :content => "Signin")
      response.should have_selector('a[href="/"]>img')
    end
end