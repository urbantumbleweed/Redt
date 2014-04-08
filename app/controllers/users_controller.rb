class UsersController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def delete

  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)

  end
end
