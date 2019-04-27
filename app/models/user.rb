class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 225 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  validates :description, length: { maximum: 255 }
  validates :location, length: { maximum: 100 }

  has_many :microposts, dependent: :destroy

  has_many :goods
  has_many :good_microposts, through: :goods, source: :micropost, dependent: :destroy

  def good(micropost)
    self.goods.find_or_create_by(micropost_id: micropost.id)
  end

  def ungood(micropost)
    good = self.goods.find_by(micropost_id: micropost.id)
    good.destroy if good
  end

  def good?(micropost)
    self.good_microposts.include?(micropost)
  end  
end
