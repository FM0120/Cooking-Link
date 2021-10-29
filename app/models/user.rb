class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :users, dependent: :destroy
  has_many :favolites, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :makeings, dependent: :destroy

  has_many :relathionships,class_name: "Relathionship", foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relathionships,class_name: "Relathionship", foreign_key: "followed_id",dependent: :destroy
  has_many :followings, through: :relathionships,source: :followed
  has_many :followers, through: :passive_relathionships,source: :follower
  attachment :image
  # attachment :profile_image
  def following?(user)
  followings.include?(user)
  end
  def follow(user_id)
  relathionships.create(followed_id: user_id)
  end
  def unfollow(user_id)
  relathionships.find_by(followed_id: user_id).destroy
  end
  
  def self.search(search,word)
    case search
      when "forward_match" then where("name LIKE?","#{word}%")
      when "backward_match" then where("name LIKE?","%#{word}")
      when "perfect_match" then where(name: word)
      when "partial_match" then where("name LIKE?","%#{word}%")
      else all
    end
  end
  
  validates :name, presence: true ,length: { minimum: 2,maximum:20 }
  validates :name, uniqueness: true
  
end
