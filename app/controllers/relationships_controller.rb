class RelationshipsController < ApplicationController

  # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
#————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    user = User.find(params[:user_id])
    @user = User.find(params[:user_id])
    @diaries_side = @user.diaries.reverse_order
    @users = user.followings.page(params[:page]).per(10).reverse_order
  end

  def followers
    user = User.find(params[:user_id])
    @user = User.find(params[:user_id])
    @diaries_side = @user.diaries.reverse_order
    @users = user.followers.page(params[:page]).per(10).reverse_order
  end

end
