Rails.application.routes.draw do

  root to: "homes#top"
  get  '/homes/about', to: 'homes#about', as: 'about'

  devise_for :users

  resources :destinations, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]

    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  get '/search', to: 'searches#search'
end
