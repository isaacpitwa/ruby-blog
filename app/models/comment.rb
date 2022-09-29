class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true, length: { minimum: 3, maximum: 255 }
  def update_comment_counter
    post.comments_counter = 0 if post.comments_counter.nil?
    post.increment!(:comments_counter)
  end
end