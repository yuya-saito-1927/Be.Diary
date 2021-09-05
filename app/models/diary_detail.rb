class DiaryDetail < ApplicationRecord
  
  #アソシエーション設定
  belongs_to :diary
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  #イメージファイルの導入
  attachment :diary_detail_image
  
  #バリデーション設定
  validates :title, presence: true, length: { in: 2..20 }
  validates :action, presence: true
  validates :mind, presence: true
  
  #あるユーザーが特定の投稿をいいねしているかどうかの確認
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
