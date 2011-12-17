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
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.first_name
  end
end
