class UsersController < ApplicationController

  before_action except: [:create, :new] do
    if @current_user.nil?
      redirect_to sign_in_path, notice: "Please Sign In"
    end
  end

  def index
    @users = User.where("id != ?", @current_user.id)

  end

  def show
    @user = User.find_by id: params[:id]
    @current_user = User.find_by id: session[:user_id]
    @tweet = Tweet.new
    @users = User.where("id != ?", @current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.photo_url = params[:user][:photo_url]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome #{@user.username}"
    else
      render :new
    end
  end

  def following
    @users = @current_user.following_users
  end

  def follow
    user = User.find_by! id: params[:user_id]
    @current_user.follow(user)
    redirect_to users_path, notice: "Following"
  end

  def unfollow
    user = User.find_by! id: params[:user_id]
    @current_user.stop_following(user)
    redirect_to users_path, notice: "Unfollowing"
  end
end
