class Diary < ApplicationRecord
  
  #アソシエーション設定
  belongs_to :user
  has_many :diary_details
  
  #イメージファイルの導入
  attachment :diary_image
  
  #タグつけ機能の導入
  acts_as_taggable
  
  #バリデーション
  validates :title, presence: true, length: { in: 2..20 }
  validates :introduction, presence: true, length: { maximum: 100 }
  
end
