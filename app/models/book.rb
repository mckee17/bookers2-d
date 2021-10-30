class Book < ApplicationRecord
   belongs_to :user
   has_many :favorites, dependent: :destroy
   has_many :book_comments, dependent: :destroy

   def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
   end

   scope :sort_id, -> {order(id: :DESC)}
   scope :sort_rate, -> {order(rate: :DESC, user_id: :ASC)}
   scope :search_category, -> category_search {where(category: category_search)}

   validates :title, presence: true
   validates :body, presence: true, length:{maximum: 200}

end