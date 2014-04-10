   class SessionsController < ApplicationController

  def new
    # if current_user
    #   flash[:notice]="You are already logged in, silly!"
    #   redirect_to user_path(current_user)
    # end
  end

  def create
    if params[:username_or_email].include? "@"
    @user = User.find_by(email: params[:username_or_email])
    else
    @user = User.find_by(username: params[:username_or_email])
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice]="Login info not found. Please try again."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
