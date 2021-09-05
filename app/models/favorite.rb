class Favorite < ApplicationRecord
  
  #アソシエーション設定
  belongs_to :user
  belongs_to :diary_detail
  
end
