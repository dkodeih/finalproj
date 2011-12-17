class UsersController < ApplicationController
  
  def show
     @user = User.find(params[:id])
     @title = @user.first_name + " " + @user.last_name
  end

  def new
     @user = User.new
     @title = "Signup"
  end
  def create
    @user = User.new(params[:user])
    if @user.save
       sign_in @user
      flash[:success] = "Welcome to Super Awesome Animal Site!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
