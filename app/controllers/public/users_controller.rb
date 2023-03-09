class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    # @user = User.find(current_user.id)
    @user = User.find(params[:user_id]) #←これだとエラーになる
    @posts = @user.posts
    @post = Post.new
  end

  def index
    @users = User.all.page(params[:page]).per(10)
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_my_page_path(current_user), notice: "更新に成功しました！"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end


end
