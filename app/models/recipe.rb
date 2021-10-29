class Recipe < ApplicationRecord
   belongs_to :user
   has_many :post_comments, dependent: :destroy
   has_many :makings, dependent: :destroy
   has_many :favolites, dependent: :destroy
   accepts_nested_attributes_for :makings, allow_destroy: true
   attachment :image
   def favolited_by?(user)
      Favolite.where(user_id: user.id).exists?
   end

   def self.search(search, word)
     if search == "forward_match"
      @recipe = Recipe.where("title LIKE?","#{word}%")
     elsif search == "backward_match"
      @recipe = Recipe.where("title LIKE?","%#{word}")
     elsif search == "perfect_match"
       @recipe = Recipe.where("#{word}")
     elsif search == "partial_match"
       @recipe = Recipe.where("title LIKE?","%#{word}%")
     else
       @recipe = Recipe.all
     end
     
     validates :recipe_title,:makings,:image,:food, presence: true
     
   end



end
