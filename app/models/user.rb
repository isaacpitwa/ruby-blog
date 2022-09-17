class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :likes
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  def most_recent_three_posts
    posts.order!(created_at: :desc).limit(3)
  end
end
