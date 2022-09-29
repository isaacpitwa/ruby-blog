require 'rails_helper'

RSpec.describe 'Post index', type: :system do
  user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
  it 'can see the users profile picture' do
    User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    visit '/users'
    expect(page).to have_css('img')
  end

  it 'can see the users name' do
    User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    visit '/users'
    expect(page).to have_content('Demo User')
  end

  it 'can see the number of posts' do
    User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post1 = Post.create(title: 'post1', text: 'text1', user: user)
    post2 = Post.create(title: 'post2', text: 'text2', user: user)
    post1.update_post_counter
    post2.update_post_counter
    visit '/users'
    expect(page).to have_content('2')
  end

  it 'can see the posts title' do
    User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    Post.create(title: 'post1', text: 'text1', user: user)
    Post.create(title: 'post2', text: 'text2', user: user)
    visit "/users/#{user.id}/posts"
    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
  end

  it 'can see the first comments on a posts' do
    post1 = Post.create(title: 'post1', text: 'text1', user: user)
    post2 = Post.create(title: 'post2', text: 'text2', user: user)
    Comment.create(text: 'comment1', user: user, post: post1)
    Comment.create(text: 'comment2', user: user, post: post2)
    visit "/users/#{user.id}/posts"
    expect(page).to have_content('comment1')
    expect(page).to have_content('comment2')
  end

  it 'can see the number of comments on a post' do
    User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    post1 = Post.create(title: 'post1', text: 'text1', user: user)
    post2 = Post.create(title: 'post2', text: 'text2', user: user)
    post1.update_post_counter
    post2.update_post_counter
    comment1 = Comment.create(text: 'comment1', user: user, post: Post.first)
    comment2 = Comment.create(text: 'comment2', user: user, post: Post.last)
    comment1.update_comment_counter
    comment2.update_comment_counter
    visit '/users'
    expect(page).to have_content('2')
  end
end
