require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Demo User', photo: '', bio: 'Lorem Ipsum Dolor Sit Amet  Consectetur Adipiscing Elit')
  Post.create(title: 'post1', text: 'text1', user: user)
  describe 'GET /users/:id/posts' do
    it 'response for index action status is correct' do
      get user_posts_path(User.last)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(User.last)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'response for show action status is correct' do
      get user_post_path(User.last, Post.last)
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      get user_post_path(User.last, Post.last)
      expect(response).to render_template('show')
    end
  end
end
