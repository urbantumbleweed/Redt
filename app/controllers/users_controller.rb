class UsersController < ApplicationController

  before_action :authenticate, only: [:destroy, :update]

  def index #admin info
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
    @user = User.find(params[:id])
    # if @user.links
    # @links = @user.links
    # end
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
