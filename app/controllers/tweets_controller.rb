class TweetsController < ApplicationController


  before_action except: [] do
    if @current_user.nil?
      redirect_to sign_in_path, notice: "Please Sign In"
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new
    @tweet.body = params[:tweet][:body]
    @tweet.picture = params[:tweet][:picture]
    @tweet.user = @current_user
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

end
