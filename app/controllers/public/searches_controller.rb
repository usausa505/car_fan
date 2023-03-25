class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word])
      @users = @users.page(params[:page]).per(10)
    else
      @posts = Post.looks(params[:search], params[:word])
      @posts = @posts.page(params[:page]).per(10)
    end
  end

end
