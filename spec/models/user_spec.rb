require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Lorem ipsum dolor sit amet') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer and greater than or equal to 0' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#most_recent_three_posts' do
    it 'should return the most recent three posts' do
      expect(subject.most_recent_three_posts.count).to be <= 3
    end
  end
end