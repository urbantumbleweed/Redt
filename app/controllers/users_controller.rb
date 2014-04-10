class UsersController < ApplicationController

  before_action :authenticate, only: [:edit,:update,:destroy]

  def index #admin info
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @links = @user.links
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:notice]="Please correct the following errors:"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user=User.find(params[:id])
      @user.update(user_params)
      redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id]=nil
    @user.destroy
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)

  end
end
