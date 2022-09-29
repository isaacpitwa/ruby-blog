require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user: User.first, post: Post.first) }

  before { subject.save }

  it 'author should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'post  likes counter  should be present' do
    subject.post = Post.new(title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet',
                            comments_counter: 0, likes_counter: 0, user: User.first)
    expect(subject.post.likes_counter).to eq(0)
  end

  describe '#update_likes_counter' do
    it 'should increment the likes_counter of the post' do
      subject.post = Post.new(title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet',
                              comments_counter: 0, likes_counter: 0, user: User.first)
      subject.update_likes_counter
      expect(subject.post.likes_counter).to eq(1)
    end
  end
end
