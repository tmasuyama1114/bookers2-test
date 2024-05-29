Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root :to =>"homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
end
