class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now[:notice] = "Username and/or Password does not match."
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path, notice: "Signed out."
  end


end
