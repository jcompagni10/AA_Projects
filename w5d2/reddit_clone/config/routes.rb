Rails.application.routes.draw do

  resources :users, only: [:new, :create, :index, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:show, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
