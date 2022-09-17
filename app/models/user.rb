class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :likes
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
