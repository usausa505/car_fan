class Public::PostsController < ApplicationController

  before_action :is_matching_login_user_on_post, only: [:edit, :update, :destroy]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "投稿に成功しました！"
    else
      @user = current_user
      @posts = Post.all
      render "index"
    end
  end

  def index
    @post = Post.new
    @user = current_user
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @new_post = Post.new
    @user = @post.user
    @posts = Post.all
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "編集に成功しました！"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿の削除に成功しました！"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, images: [])
  end

  def is_matching_login_user_on_post
    @post = Post.find(params[:id])
    @user = @post.user
    unless @user == current_user
      redirect_to posts_path
    end
  end

end
