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
    @diaries = Diary.all.page(params[:page]).per(6).reverse_order
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

  def diary_params
    params.require(:diary).permit(:title, :diary_image, :introduction)
  end

end
