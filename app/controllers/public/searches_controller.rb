class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word])
      @users = @users.page(params[:page])
    else
      @posts = Post.looks(params[:search], params[:word])
      @posts = @posts.page(params[:page])
    end

  end

end
