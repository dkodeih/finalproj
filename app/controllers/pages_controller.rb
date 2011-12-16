class PagesController < ApplicationController
  def home
    @title = 'Home'
  end

  def contact
      @title = 'Contact'
  end
  def signin
      @title = 'Signin'
  end

end
