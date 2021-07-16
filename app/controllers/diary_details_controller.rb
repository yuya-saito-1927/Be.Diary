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
      redirect_to diary_path(@diary.id), notice: "日記内容が作成されました"
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def diary_detail_params
    params.require(:diary_detail).permit(:title, :diary_detail_image, :action, :keep, :problem, :improve, :mind, :free)
  end


end