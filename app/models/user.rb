class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :users, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :makeings, dependent: :destroy
  
  has_many :relationships,class_name: "Relationship",  foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships,class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
  has_many :followings, through: :relationships,source: :followed
  has_many :followers, through: :passive_relationships,source: :follower
  attachment :image
end
