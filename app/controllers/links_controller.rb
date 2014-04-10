class LinksController < ApplicationController

  def index
    # @links=Link.all.order(:tally :desc)
  end

  def show
    @link=Link.find(params[:id])
  end

  def new
    @link=Link.new
    @user=current_user
    @path = [@user, @link]
  end

  def create
    @user=User.find(params[:user_id])
    @link=@user.links.create!(link_params)
    if @link.save
    redirect_to @user
    else
    flash[:notice]="Please correct the following errors."
    render 'new'
    end
  end

  def edit
    @link=Link.find(params[:id])
    @user = current_user
    @path = @link
  end

  def update
    @link=Link.find(params[:id])
    @link.update(link_params)
    redirect_to @link
  end

  def upvote
    @user=current_user
    @link=Link.find(params[:id])
    @link.score_link(@user, 1)
    redirect_to @user
  end

  def downvote
    @user=current_user
    @link=Link.find(params[:id])
    @link.score_link(@user, -1)
    redirect_to @user
  end

  def destroy
    @user=current_user
    @link=Link.find(params[:id])
    @link.destroy
    redirect_to @user
  end

  private
  def link_params
    params.require(:link).permit(:link_url,:title,:tally)
  end

end
