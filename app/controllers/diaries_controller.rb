class DiariesController < ApplicationController
  
  #新規日記作成画面
  def new
    @diary = Diary.new
  end
  
  #新規日記作成処理
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
  
  #日記一覧画面
  def index
    @user = current_user
    @diaries_side = @user.diaries.reverse_order
    #ページネーション機能（1ページにつき８個の設定）
    @diaries = Diary.all.page(params[:page]).per(8).reverse_order
    #タグ機能、タグ検索による日記一覧の表示
    if params[:tag_name]
      @diaries = Diary.tagged_with("#{params[:tag_name]}").page(params[:page]).per(8).reverse_order
    end
  end

  #日記詳細画面
  def show
    @diary = Diary.find(params[:id])
    @user = @diary.user
    #日記内容一覧の表示（ページネーション）
    @diary_details = @diary.diary_details.page(params[:page]).per(10).reverse_order
  end

  #日記編集画面
  def edit
    @diary = Diary.find(params[:id])
  end

  #日記更新処理
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

  #日記削除処理
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to user_path(current_user.id), notice: "日記が削除されました"
  end

  #日記全削除処理
  def destroy_all
    @diaries = current_user.diaries
    @diaries.destroy_all
    redirect_to user_path(current_user.id), notice: "日記が全て削除されました"
  end

  private

  def diary_params
    params.require(:diary).permit(:diary_id, :title, :diary_image, :introduction, :tag_list)
  end

end
