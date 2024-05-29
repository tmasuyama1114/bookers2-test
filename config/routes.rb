Rails.application.routes.draw do
  get 'searches/search'
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  root :to =>"homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users

  resources :users, only: [:index,:show,:edit,:update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get '/search', to: 'searches#search'
end
