class Admin::PostsController < ApplicationController
  
  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿の削除に成功しました！"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, images: [])
  end


end
