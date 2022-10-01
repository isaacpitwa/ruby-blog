class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_three_posts
    posts.order!(created_at: :desc).limit(3)
  end

  def authenticate(password)
    valid_password?(password)
  end
end
