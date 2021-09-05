class PostComment < ApplicationRecord

  #アソシエーションの設定
  belongs_to :user
  belongs_to :diary_detail

  #バリデーションの設定
  validates :comment, presence: true

end
