class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :email, :password))
    session[:user_id] = @user.id

    if @user.save
      redirect_to '/'
    else
      render 'new'
    end
  end
end
