class Micropost < ApplicationRecord
  belongs_to :user

  validates :post, presence: true, length: { maximum: 255 }
end
