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
    if @user
      redirect_to @user
    else
      flash[:notice]="Please correct the following errors"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user.update(user_params)
      redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy


  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)

  end
end
