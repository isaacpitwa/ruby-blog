require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Title', text: 'Text', user: User.first) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 255 characters' do
    subject.title = 'a' * 256
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

  it 'comments_counter must be integer and greater than equal to 0' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be integer and greater than equal to 0' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#update_post_counter' do
    it 'should increment the posts_counter of the user' do
      subject.user = User.new(name: 'Demo User', posts_counter: 0)
      posts_counter = subject.user.posts_counter
      subject.update_post_counter
      expect(subject.user.posts_counter).to eq(posts_counter + 1)
    end
  end

  describe '#most_recent_five_comments' do
    it 'should return the most recent five comments' do
      expect(subject.most_recent_five_comments.count).to be <= 5
    end
  end
end
