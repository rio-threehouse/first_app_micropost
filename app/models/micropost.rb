class Micropost < ApplicationRecord
  belongs_to :user

  validates :post, presence: true, length: { maximum: 255 }

  has_many :goods
  has_many :good_users, through: :goods, source: :user, dependent: :destroy
end
