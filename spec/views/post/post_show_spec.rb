require 'rails_helper'

RSpec.describe 'Post show', type: :system do
  it 'can see the post\'s title.' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post = Post.create(title: 'post1', text: 'text1', user: user)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('post1')
  end
  it 'can see who wrote the post' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post = Post.create(title: 'post1', text: 'text1', user: user)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('Demo User')
  end
  it 'can see how many comments it has' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')

    post = Post.create(title: 'post1', text: 'text1', user: user)
    comment1 = Comment.create(text: 'comment1', user: user, post: post)
    comment2 = Comment.create(text: 'comment2', user: user, post: post)
    comment1.update_comment_counter
    comment2.update_comment_counter
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('2')
  end
  it 'can see how many likes it has' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post = Post.create(title: 'post1', text: 'text1', user: user)
    like1 = Like.create(user: user, post: post)
    like2 = Like.create(user: user, post: post)
    like1.update_likes_counter
    like2.update_likes_counter

    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('2')
  end
  it 'can see the post body' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post = Post.create(title: 'post1', text: 'text1', user: user)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('text1')
  end
  it 'can see the username of each commentor' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post = Post.create(title: 'post1', text: 'text1', user: user)
    Comment.create(text: 'comment1', user: user, post: post)
    Comment.create(text: 'comment2', user: user, post: post)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('Demo User')
  end
  it 'can see the comment each commentor left' do
    user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post = Post.create(title: 'post1', text: 'text1', user: user)
    Comment.create(text: 'comment1', user: user, post: post)
    Comment.create(text: 'comment2', user: user, post: post)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('comment1')
    expect(page).to have_content('comment2')
  end
end
