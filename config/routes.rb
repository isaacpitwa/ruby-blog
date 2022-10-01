Rails.application.routes.draw do
  default_url_options :host => "127.0.0.1:3000"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # JWT Authentication  routes
  post '/login', to: 'auth#login', default: {:format => :json}
  post '/signup', to: 'auth#signup', default: {:format => :json}
  post '/logout', to: 'auth#logout', default: {:format => :json}

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create,]
    post "/posts/:id/like" => "posts#like", as: :like
    post "/posts/:id/comment" => "posts#comment", as: :comments
  end
  
  scope 'api' do
    get '/posts/:id/comments' => 'api/comments#index', as: :api_post_comments
    post '/posts/:id/comments' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end

end
