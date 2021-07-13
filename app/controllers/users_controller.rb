class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @diaries_side = @user.diaries.reverse_order
  end

  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.page(params[:page]).per(6).reverse_order
    @diaries_side = @user.diaries.reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'ユーザ情報が更新されました'
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

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
