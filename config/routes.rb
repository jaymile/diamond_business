Rails.application.routes.draw do
  
  root :to => 'events#index'
  root :to => 'posts#index'


  devise_for :users

  resources :users, only: [:show]

  resources :charges


  resources :events do 
    resources :participations, only: [:index, :new, :create, :show]
  end

  namespace :admin do
    root :to => 'admin#index'
    resources :users  
    resources :events
    resources :posts 

  end

end
