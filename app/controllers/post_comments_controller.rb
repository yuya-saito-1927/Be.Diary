class PostCommentsController < ApplicationController

  #コメント作成処理
  def create
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:diary_detail_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.diary_detail_id = @diary_detail.id
    comment.save
    @post_comment = PostComment.new
  end

  #コメント削除処理
  def destroy
    PostComment.find_by(id: params[:id], diary_detail_id: params[:diary_detail_id]).destroy
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:diary_detail_id])
    @post_comment = PostComment.new
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
