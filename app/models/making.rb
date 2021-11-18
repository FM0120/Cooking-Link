class Making < ApplicationRecord
  belongs_to:recipe
  attachment :image
  validates :making_detail,presence: true
end
