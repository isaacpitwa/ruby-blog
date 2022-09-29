require 'rails_helper'

RSpec.describe 'User show', type: :system do
  it 'shows the users profile picture' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    visit "/users/#{user.id}"
    expect(page).to have_css('img')
  end
  it 'displays the users name' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    visit "/users/#{user.id}"
    expect(page).to have_content('Demo User1')
  end
  it 'displays the number of posts of the user' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    Post.create(title: 'post1', text: 'text1', user: user)
    Post.create(title: 'post2', text: 'text2', user: user)
    visit "/users/#{user.id}"
    expect(page).to have_content('2')
  end
  it 'displays the first 3 posts of the user' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    Post.create(title: 'post1', text: 'text1', user: user)
    Post.create(title: 'post2', text: 'text2', user: user)
    Post.create(title: 'post3', text: 'text3', user: user)
    Post.create(title: 'post4', text: 'text4', user: user)
    Post.create(title: 'post5', text: 'text5', user: user)
    visit "/users/#{user.id}"
    expect(page).to have_content('post5')
    expect(page).to have_content('post4')
    expect(page).to have_content('post3')
    expect(page).to_not have_content('post1')
    expect(page).to_not have_content('post1')
  end
  it 'displays a button to see the rest of the posts' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    Post.create(title: 'post1', text: 'text1', user: user)
    Post.create(title: 'post2', text: 'text2', user: user)
    Post.create(title: 'post3', text: 'text3', user: user)
    Post.create(title: 'post4', text: 'text4', user: user)
    Post.create(title: 'post5', text: 'text5', user: user)
    visit "/users/#{user.id}"
    expect(page).to have_link('See all posts')
  end
  it 'redirects to the posts show page when clicking a users post' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    Post.create(title: 'post1', text: 'text1', user: user)
    Post.create(title: 'post2', text: 'text2', user: user)
    Post.create(title: 'post3', text: 'text3', user: user)
    Post.create(title: 'post4', text: 'text4', user: user)
    Post.create(title: 'post5', text: 'text5', user: user)
    visit "/users/#{user.id}"
    click_link 'post5'
    expect(page).to have_content('post5')
  end
  it 'redirects to the users posts index page when click see all posts' do
    user = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    Post.create(title: 'post1', text: 'text1', user: user)
    Post.create(title: 'post2', text: 'text2', user: user)
    Post.create(title: 'post3', text: 'text3', user: user)
    Post.create(title: 'post4', text: 'text4', user: user)
    Post.create(title: 'post5', text: 'text5', user: user)
    visit "/users/#{user.id}"
    click_link 'See all posts'
    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
  end
end
