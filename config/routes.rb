Rails.application.routes.draw do
  
  resources :relationships, only: [:create, :destroy]
  
  
  devise_for :users
  
  resources :articles do
    resources :comments
  end
  
  resources :users do
    collection do
      get 'feed', to: 'users#feed', as: :feed
      get 'my_profile', to: 'users#my_profile', as: :my_profile
    end
  	member do
      get :following, :followers
    end
  end
  
  
  root 'users#my_profile'

end
