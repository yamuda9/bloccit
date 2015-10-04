Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :confirm, only: [:new]

  get 'about' => 'welcome#about'
  get '/users/new/confirm' => 'users#confirm'

  root to: 'welcome#index'
end
