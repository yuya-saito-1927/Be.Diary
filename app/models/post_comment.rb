class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :diary_detail

  validates :comment, presence: true

end
