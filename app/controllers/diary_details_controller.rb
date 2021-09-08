class DiaryDetailsController < ApplicationController
  
  #日記内容作成画面
  def new
    @diary_detail = DiaryDetail.new
  end

  #日記内容作成処理
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

  #日記内容詳細画面
  def show
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:id])
    @post_comment = PostComment.new
  end

  #日記内容編集画面
  def edit
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:id])
  end

  #日記内容更新処理
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

  #日記内容削除
  def destroy
    @diary = Diary.find(params[:diary_id])
    @diary_detail = DiaryDetail.find(params[:id])
    @diary_detail.diary_id = @diary.id
    @diary_detail.destroy
    redirect_to diary_path(@diary.id), notice: "日記内容が削除されました"
  end
  
  #日記内容全削除処理に関しては作成しませんでした。日記を削除した場合に全て内容も削除されるため。

  private

  def diary_detail_params
    params.require(:diary_detail).permit(:title, :diary_detail_image, :action, :keep, :problem, :improve, :mind, :free)
  end


end