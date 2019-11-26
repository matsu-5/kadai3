Rails.application.routes.draw do
  devise_for :users
  resources :books
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :users, only: [:index,:show, :edit, :update]
end
