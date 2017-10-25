Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index', as: 'index'
  post '/users', to: 'users#create', as: 'create'
  get '/users/new', to: 'users#new', as: 'new'
  get '/users/:id/edit', to: 'users#edit', as: 'edit'
  get '/users/:id', to: 'users#show', as: 'show'
  patch '/users/:id', to: 'users#update', as: 'patch_update'
  put '/users/:id', to: 'users#update', as: 'put_update'
  delete '/users/:id', to: 'users#destroy', as: 'delete'
end
