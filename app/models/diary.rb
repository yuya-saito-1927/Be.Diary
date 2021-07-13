class Diary < ApplicationRecord
  
  belongs_to :user
  attachment :diary_image
  
  validates :title, presence: true, length: { in: 2..20 }
  validates :introduction, presence: true, length: { maximum: 100 }
  
end
