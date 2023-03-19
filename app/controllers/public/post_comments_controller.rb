class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    #@commentの部分をすべて@post_commentに変更(バリデーションを設定するため)。3/19
    #空投稿を防ぐため、unless構文並びにバリデーション用のrender 'error'を追加
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    unless @post_comment.save
      render 'error'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find(params[:id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, post_comment_images: [])
  end

end
