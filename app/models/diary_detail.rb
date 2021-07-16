class DiaryDetail < ApplicationRecord
  
  belongs_to :diary
  attachment :diary_detail_image
  
  validates :title, presence: true, length: { in: 2..20 }
  validates :action, presence: true
  validates :mind, presence: true
  
end
