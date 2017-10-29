Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get "/users", to: "users#index"
  # post "/users", to: "users#create"
  # # get '/users/new', to: 'users#new'
  # # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :artworks,except:[:new, :edit,:index]

  resources :artwork_shares, only: [:create, :destroy]

  # get '/users/:id/artworks', to: 'artworks#index'

  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index]
  end

resources :comments, only: [:create, :index, :destroy]

end
