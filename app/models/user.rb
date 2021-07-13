class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diaries
  attachment :profile_image

  validates :user_name, presence: true, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

end
