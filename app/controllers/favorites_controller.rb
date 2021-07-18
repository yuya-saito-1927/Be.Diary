class FavoritesController < ApplicationController

  def create
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:diary_detail_id])
    favorite = current_user.favorites.new(diary_detail_id: @diary_detail.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:diary_detail_id])
    favorite = current_user.favorites.find_by(diary_detail_id: @diary_detail.id)
    favorite.destroy
    redirect_to request.referer
  end

end
