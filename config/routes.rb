Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: "homes#top"

  resources :works do
    resources :work_comments, only: [:create, :destroy] do
      resource :thank, only: [:create, :destroy]
    end
    resource :work_favorite, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resource :reletionships, only: [:create, :destroy]
    get "followings" => "reletionships#followings", as: "followings"
    get "followers" => "reletionships#followers", as: "followers"
  end

  resources :chats, only: [:show, :create, :destroy]
  resources :rooms, only: [:index]

  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
