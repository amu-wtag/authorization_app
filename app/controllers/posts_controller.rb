# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def show
    # @post is loaded by load_and_authorize_resource
  end

  def new
    # @post is loaded by load_and_authorize_resource
  end

  def create
    @post.user = current_user  # Assign the current user to the post
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @post is loaded by load_and_authorize_resource
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
