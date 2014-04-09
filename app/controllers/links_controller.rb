class LinksController < ApplicationController

  def index
    @links=Link.all
    @user=User.find(params[:user_id])
  end

  def show
    @link=Link.find(params[:id])
  end

  def new
    @link=Link.new
    @user=User.find(params[:user_id])
  end

  def create
    @link=Link.create(link_params)
    redirect_to @link
  end

  def edit
    @link=Link.find(params[:id])
    @user=current_user
  end

  def update
    @link=Link.find(params[:id])
    @link.update(link_params)
    redirect_to @link
  end

  def destroy
    @link=Link.find(params[:id])
    @link.destroy
  end

  private
  def link_params
    params.require(:link).permit(:link_url,:title,:tally)
  end

end
