class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favolites, dependent: :destroy
  has_many :favolites_users, through: :favolites, source: :user
  has_many :post_comments, dependent: :destroy
  has_many :makings, dependent: :destroy

  accepts_nested_attributes_for :makings, allow_destroy: true
  attachment :image

  validates :recipe_title, :image, :food, presence: true

  def favolited_by?(user)
    Favolite.where(user_id: user.id).exists?
  end

  def self.search(search, word)
    if search == "forward_match"
      @recipe = Recipe.where("recipe_title LIKE?", "#{word}%")
    elsif search == "backward_match"
      @recipe = Recipe.where("recipe_title LIKE?", "%#{word}")
    elsif search == "perfect_match"
      @recipe = Recipe.where("recipe_title LIKE?","#{word}")
    elsif search == "partial_match"
      @recipe = Recipe.where("recipe_title LIKE?", "%#{word}%")
    else
      @recipe = Recipe.all
    end
  end

  private

  def make_check
    if makings.present?
      errors.add(:base, "詳細が未入力です")
    end
  end
end
