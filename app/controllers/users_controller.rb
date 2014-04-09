class UsersController < ApplicationController

  before_action :authenticate, only: [:destroy, :update]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def show
    @user = current_user
    @links = @user.links
  end

  def edit
    @user = current_user
  end

  def update
      @user.update(user_params)
      redirect_to @user
  end

  def destroy
    current_user.e
    @user = User.find(params[:id])
    @user.destroy


  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)

  end
end
