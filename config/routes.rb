Rails.application.routes.draw do

  root "products#index"

  namespace :admin do
    resources :categories
    resources :products
  end
  devise_for :users
  resources :products
  resources :blogs
  resources :contacts
end
