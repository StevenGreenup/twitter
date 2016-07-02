class HomeController < ApplicationController

  before_action except: [] do
    if @current_user.nil?
      redirect_to sign_in_path, notice: "Please Sign In"
    end
  end


  def index
    @current_user = User.find_by id: session[:user_id]
    @users = User.where("id != ?", @current_user.id)
    @tweet = Tweet.new
  end
end
