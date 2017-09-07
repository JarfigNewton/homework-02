Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'catalog#index'
  resources :books
  resources :authors
  resources :catalog, only: :index
end
