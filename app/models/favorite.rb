class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :diary_detail
  
end
