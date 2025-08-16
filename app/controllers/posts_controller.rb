class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post[:user_id] = current_user.id

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!

    redirect_to root_path
  end

  private

  def user_params
    params.expect(post: [:title, :body, :user_id])
  end
end
