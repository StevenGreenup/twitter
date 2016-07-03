class CommentsController < ApplicationController
  before_action except: [] do
    if @current_user.nil?
      redirect_to sign_in_path, notice: "Please Sign In"
    end
  end

  def new
    @tweet = Tweet.find_by id: params[:tweet_id]
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.tweet_id = params[:comment][:tweet_id]
    @comment.body = params[:comment][:body]
    @comment.user = @current_user
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end
end
