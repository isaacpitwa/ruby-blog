require 'rails_helper'

RSpec.describe 'User index', type: :system do
  it 'displays the usernames of the users' do
    User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    User.create(name: 'Demo User2', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    visit '/users'
    expect(page).to have_content('Demo User1')
    expect(page).to have_content('Demo User2')
  end

  it 'displays profile photos of the users' do
    User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    User.create(name: 'Demo User2', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    visit '/users'
    expect(page).to have_css('img')
  end

  it 'displays the number of posts of the users' do
    user1 = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    user2 = User.create(name: 'Demo User2', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    Post.create(title: 'post1', text: 'text1', user: user1)
    Post.create(title: 'post2', text: 'text2', user: user2)
    Post.create(title: 'post3', text: 'text3', user: user2)
    visit '/users'
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end

  it 'redirects to the user profile page when clicking the username' do
    user1 = User.create(name: 'Demo User1', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet')
    user2 = User.create(name: 'Demo User2', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
    Post.create(title: 'post1', text: 'text1', user: user1)
    Post.create(title: 'post2', text: 'text2', user: user2)
    visit '/users'
    click_link 'Demo User1'
    expect(page).to have_content('Lorem Ipsum Dolor Sit Amet')
  end
end
