class Making < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  attachment :image
end
