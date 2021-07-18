class PostCommentsController < ApplicationController

  def create
    @diary_detail = DiaryDetail.find(params[:diary_detail_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.diary_detail_id = @diary_detail.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    PostComment.find_by(id: params[:id], diary_detail_id: params[:diary_detail_id]).destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
