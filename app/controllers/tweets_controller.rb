class TweetsController < ApplicationController


  before_action except: [] do
    if @current_user.nil?
      redirect_to sign_in_path, notice: "Please Sign In"
    end
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find_by id: params[:id]
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

  def favorite
    @tweet = Tweet.find_by id: params[:id]
    @user = User.find_by id: params[:user_id]
    @tweet.favorites += 1
    if @tweet.save
      redirect_to root_path
    end
  end

  def unfavorite
    @tweet = Tweet.find_by id: params[:id]
    @user = User.find_by id: params[:user_id]
    @tweet.unfavorites += 1
    if @tweet.save
      redirect_to root_path
    end
  end

  def edit
  @tweet = Tweet.find_by id: params[:id]
  end

def update
  @tweet = Tweet.find_by id: params[:id]
  @tweet.body = params[:tweet][:body]
  @tweet.picture = params[:tweet][:picture]
  if @tweet.save
    redirect_to root_path
  else
    render :edit
  end
end

def destroy
  Tweet.find(params[:id]).destroy
  redirect_to root_path
end




end
