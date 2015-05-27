class PicksController < ApplicationController
  before_action :user

  def index
    @picks = @user.picks
  end

  def create
  	@pick = @user.picks.new(strong_params)
    if @pick.save
      redirect_to user_picks_path
    else
      render :new
    end
  end

  def new
  	@pick = Pick.new
  end

  def destroy
    @pick = @user.picks.find(params[:id])
    @pick.destroy
    redirect_to user_picks_path
  end

  private
    def strong_params
    	params.require(:pick).permit(:item, :url)
    end

    def user
      @user = User.find(params[:user_id])
    end
end
