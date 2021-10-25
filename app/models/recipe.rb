class Recipe < ApplicationRecord
   belongs_to :user
   has_many :post_comments, dependent: :destroy
   has_many :makings, dependent: :destroy
   accepts_nested_attributes_for :makings, allow_destroy: true
   attachment :image
   def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
   end

end
