class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render flash[:notice] = "Somthing is wrong try again"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
