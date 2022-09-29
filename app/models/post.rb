class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :text, length: { minimum: 3, maximum: 5000 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    user.posts_counter = 0 if user.posts_counter.nil?
    user.increment!(:posts_counter)
  end

  def most_recent_five_comments
    comments.order!(created_at: :desc).limit(5)
  end
end
