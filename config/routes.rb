Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  root to: "homes#top"
  get  '/homes/about', to: 'homes#about', as: 'about'

  devise_for :users

  resources :destinations, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get '/search', to: 'searches#search'
end
