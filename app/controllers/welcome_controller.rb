class WelcomeController < ApplicationController
  def index
		@users = User.where(["email like ?", "%#{params[:search]}%"])
  end
end
