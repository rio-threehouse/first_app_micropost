class Good < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
end