class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
