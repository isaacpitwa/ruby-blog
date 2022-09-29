require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Lorem ipsum dolor sit amet', post: Post.first, user: User.first) }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text must not exceed 255 characters' do
    subject.text = 'a' * 256
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'Comments counter  should be present' do
    subject.post = Post.new(title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet',
                            comments_counter: 0, likes_counter: 0, user: User.first)
    expect(subject.post.comments_counter).to eq(0)
  end

  describe '#update_comment_counter' do
    it 'should increment the comments_counter of the post' do
      subject.post = Post.new(title: 'Lorem ipsum dolor sit amet', text: 'Lorem ipsum dolor sit amet',
                              comments_counter: 0, likes_counter: 0, user: User.first)
      subject.update_comment_counter
      expect(subject.post.comments_counter).to eq(1)
    end
  end
end
