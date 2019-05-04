class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :post, presence: true, length: { maximum: 255 }
end
