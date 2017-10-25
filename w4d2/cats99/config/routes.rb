Rails.application.routes.draw do

  resources :cats
  resources :cat_rental_requests, only: [:create, :new]
  get "cat_rental_requests/:id/deny", to: "cat_rental_requests#deny", as: :deny
  get "cat_rental_requests/:id/approve", to: "cat_rental_requests#approve", as: :approve
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
