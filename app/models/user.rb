class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
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

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow, dependent: :destroy
  has_many :reverses_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationships, source: :user, dependent: :destroy

  def follow(user)
    unless self == user
      self.relationships.find_or_create_by(follow_id: user.id)
    end
  end

  def unfollow(user)
    relationship = self.relationships.find_by(follow_id: user.id)
    relationship.destroy if relationship
  end

  def following?(user)
    self.followings.include?(user)
  end

  def feed_microposts
    Micropost.where(user_id: self.following_ids + [self.id] )
  end

  has_many :comments
  has_many :comment_microposts, through: :comments, source: :micropost, dependent: :destroy
end
