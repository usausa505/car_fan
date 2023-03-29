class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!, if: :user_url

  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    @users = @users.page(params[:page]).per(10)
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    @users = @users.page(params[:page]).per(10)
  end

  private

  def user_url
    request.fullpath.include?("/users")
  end

end
