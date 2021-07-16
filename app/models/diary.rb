class Diary < ApplicationRecord
  
  belongs_to :user
  has_many :diary_details
  attachment :diary_image
  
  validates :title, presence: true, length: { in: 2..20 }
  validates :introduction, presence: true, length: { maximum: 100 }
  
end
