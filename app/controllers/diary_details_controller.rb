class DiaryDetailsController < ApplicationController
  def new
    @diary_detail = DiaryDetail.new
  end

  def create
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.new(diary_detail_params)
    @diary_detail.diary_id = @diary.id
    if
      @diary_detail.save
      redirect_to diary_diary_detail_path(@diary, @diary_detail.id), notice: "日記内容が作成されました"
    else
      render :new
    end
  end

  def show
    @diary_detail = DiaryDetail.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:id])
    @diary_detail.diary_id = @diary.id
    if
      @diary_detail.update(diary_detail_params)
      redirect_to diary_diary_detail_path(@diary, @diary_detail.id), notice: "日記内容が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:id])
    @diary_detail.diary_id = @diary.id
    @diary_detail.destroy
    redirect_to diary_path(@diary.id), notice: "日記内容が削除されました"
  end

  private

  def diary_detail_params
    params.require(:diary_detail).permit(:title, :diary_detail_image, :action, :keep, :problem, :improve, :mind, :free)
  end


end