class UsersController < ApplicationController
  
  #ユーザ一覧画面
  def index
    #ユーザ一覧のページネーション
    @users = User.all.page(params[:page]).per(10).reverse_order
    @user = current_user
    @diaries_side = @user.diaries.reverse_order
  end

  #ユーザ詳細画面
  def show
    @user = User.find(params[:id])
    #ユーザの日記のページネーション
    @diaries = @user.diaries.page(params[:page]).per(6).reverse_order
    @diaries_side = @user.diaries.reverse_order
  end

  #ユーザ編集画面
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  #ユーザ更新処理
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'ユーザ情報が更新されました'
    else
      render :edit
    end
  end

  #ユーザ退会画面
  def unsubscribe
    @user = User.find(params[:id])
  end

  #ユーザ退会処理
  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: 'ご利用ありがとうございました'
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image, :is_deleted)
  end

end
