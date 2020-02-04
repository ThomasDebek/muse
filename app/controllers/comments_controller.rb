class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:info] = "Wrong way"
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
     # binding.pry
      redirect_to post_path(@post)
    else
      render action: "edit"
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.delete
      redirect_to @post
    else
      flash[:notice] = "Try Again"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end



