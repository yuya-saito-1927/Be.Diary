class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if
      @diary.save
      redirect_to user_path(current_user.id), notice: "日記が新規作成されました。"
    else
      render :new
    end
  end

  def index
    @user = current_user
    @diaries_side = @user.diaries.reverse_order
    @diaries = Diary.all.page(params[:page]).per(8).reverse_order
  end

  def show
    @diary = Diary.find(params[:id])
    @user = @diary.user
    @diary_details = @diary.diary_details.page(params[:page]).per(10).reverse_order
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    @diary.user_id = current_user.id
    if
      @diary.update(diary_params)
      redirect_to diary_path(@diary.id), notice: "日記が変更されました"
    else
      render :edit
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to user_path(current_user.id), notice: "日記が削除されました"
  end

  def destroy_all
    @diaries = current_user.diaries
    @diaries.destroy_all
    redirect_to user_path(current_user.id), notice: "日記が全て削除されました"
  end

  private

  def diary_params
    params.require(:diary).permit(:diary_id, :title, :diary_image, :introduction)
  end

end
