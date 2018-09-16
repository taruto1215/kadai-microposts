Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'relationships/create'

  get 'relationships/destroy'

  get 'microposts/create'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
    collection do
      get :search
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :likes
    end
    collection do
      get :search
    end
  end  
  resources :likes, only: [:create, :destroy]
end