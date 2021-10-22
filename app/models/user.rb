class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :followers, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :follower_users, through: :followers, source: :User

  has_many :followeds, class_name: 'Relationship', foreign_key:"followed_id", dependent: :destroy
  has_many :followed_users, through: :followeds, source: :User

  attachment :profile_image

  validates :name, presence: true, uniqueness: true, length:{ minimum: 2, maximum: 20}
  validates :introduction, length:{maximum: 50}

end
