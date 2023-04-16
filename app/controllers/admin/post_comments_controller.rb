class Admin::PostCommentsController < ApplicationController

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find(params[:id]).destroy
  end
  #管理者側コメント削除機能

end
