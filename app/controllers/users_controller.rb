class UsersController < ApplicationController
  def index
		if params[:search]
			@users = User.search(params[:search])
		else
			nil
		end
  end

  def show
  	@user = User.find(params[:id])
  	@pick = @user.picks
  end

  def destroy
  end
end
