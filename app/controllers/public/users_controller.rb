class Public::UsersController < ApplicationController
  before_action :authenticate_user!, if: :user_url

  def show
    @user = User.find(params[:user_id]) #←viewファイル(users/_index.html.erb)変更に伴い、:idから:user_idに変更
    @posts = @user.posts.page(params[:page]).per(10)
    @post = Post.new
  end

  def index
    @users = User.all.page(params[:page]).per(10)
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_my_page_path(current_user.id)
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

  def favorites
    @user = User.find(params[:id])
    if @user ==current_user
      favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
      @favorite_posts = Post.find(favorites)
      @favorite_posts = Kaminari.paginate_array(@favorite_posts).page(params[:page]).per(10)
    else
      redirect_to user_my_page_path(current_user)
    end
  end

  def confirm_withdraw
  end

  def withdraw
    @User = current_user
    @User.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_deleted)
  end

  def user_url
    request.fullpath.include?("/users")
  end

end
