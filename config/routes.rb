Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root :to =>"homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users

  resources :users, only: [:index,:show,:edit,:update]

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
end
