class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
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
      redirect_to root_path, notice: "Welcome #{@user.username}"
    else
      render :new
    end
  end
end
