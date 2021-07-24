class DiaryDetail < ApplicationRecord
  
  belongs_to :diary
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :diary_detail_image
  
  validates :title, presence: true, length: { in: 2..20 }
  validates :action, presence: true
  validates :mind, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
